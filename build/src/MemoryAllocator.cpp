//
// Created by os on 4/13/23.
//

#include "../h/MemoryAllocator.hpp"

 bool MemoryAllocator::initialized = false;

MemoryAllocator::FreeSegment* MemoryAllocator::free_head = nullptr;

MemoryAllocator::UsedSegment* MemoryAllocator::used_head = nullptr;

void* MemoryAllocator::starting_adress = nullptr;
void* MemoryAllocator::ending_adress = nullptr;

void *MemoryAllocator::mem_alloc(size_t size) {
    //Velicina za alokaciju
    size_t size_of_blocks = size*MEM_BLOCK_SIZE;

    if (size<=0) return nullptr;
    if (initialized == false)
    {
        // Pocetna inicijalizacija!

        initialized=true;
        //Pocetna adresa poravnata
        starting_adress = (void*)(((uint64) (HEAP_START_ADDR) /MEM_BLOCK_SIZE + 1)*MEM_BLOCK_SIZE);
        //Krajnja adresa poravnata
        ending_adress = (void*)(((uint64) (HEAP_END_ADDR) / (uint64)MEM_BLOCK_SIZE)*(uint64)MEM_BLOCK_SIZE);
        free_head = (FreeSegment*)((uint64)starting_adress);
        free_head->next= nullptr;
        free_head->prev= nullptr;

         void* a = starting_adress;
         void* b = ending_adress;
         a=b;
         b=a;


        // Pamti se velicina slobodnog prostora bez sizeof(FreeSegment) za koji je alociran jedan MEM_BLOCK_SIZE zbog poravnjanja u svim slobodnim segmentima
        // odnosno za svaku strukturu FreeSegment odnosno UsedSegment se uzima jedan MEM_BLOCK_SIZE zbog poravnanja!

        free_head->size = (size_t)((uint64)ending_adress - (uint64)starting_adress) - MEM_BLOCK_SIZE;
    }
    
        // First-fit algoritam

        FreeSegment* current = free_head;
        while (current)
        {
            if (current->size>size_of_blocks)
            {
                size_t remain = current->size-size_of_blocks - MEM_BLOCK_SIZE;

                //Uzimamo MEM_BLOCK_SIZE za zaglavlje zbog poravnjanja!


                uint64 adr = (uint64)( (uint64)current + (uint64)MEM_BLOCK_SIZE + (uint64)remain);

                UsedSegment* novi = (UsedSegment*)adr;
                novi->next= used_head;
                novi->prev= nullptr;
                novi->size=size_of_blocks;

                // Umanjujemo slobodni segment od kojeg koristimo memoriju za alokaciju.

                current->size = remain;

                //Ubacujemo novi korisceni segment u listu koriscenih segmenata
                // i to na pocetak liste zato sto pri mem_free ne moramo da imamo sortiranu listu koriscenih segmenata
                // jer svakako dobijamo segment koji smo alocirali uz pomoc mem_alloc

                if (used_head!= nullptr)
                {
                    used_head->prev = novi;
                }
                used_head = novi;
                uint64  br = ((uint64)(novi) + (uint64)MEM_BLOCK_SIZE);
                br++;
                // Vracamo lokaciju koja je iza UsedSegment strukture

                void* res;
                res = (void*)((uint64)(novi) + (uint64)MEM_BLOCK_SIZE);
                return res;



            }
            else if (current->size==size_of_blocks)
            {
                FreeSegment* next_node = current->next;
                FreeSegment* prev_node = current->prev;

                if (prev_node== nullptr)
                {
                    free_head = current->next;
                }
                else
                {
                    prev_node->next = next_node;
                }
                if (next_node!= nullptr)
                {
                    next_node->prev=prev_node;
                }

                UsedSegment* novi = (UsedSegment*)((uint64) current);
                novi->next= used_head;
                novi->prev= nullptr;
                novi->size=size_of_blocks;

                if (used_head!= nullptr)
                {
                    used_head->prev = novi;
                }
                used_head = novi;

                // Vracamo lokaciju koja je iza UsedSegment strukture

                void* res = (void*)((uint64)(novi) + (uint64)MEM_BLOCK_SIZE);
                return res;
            }
            else
            {
                current = current->next;
            }
        }
        return nullptr;


}

int MemoryAllocator::mem_free(void* adr) {

    uint64  checker_adr = (uint64)((uint64)(starting_adress) + (uint64)(MEM_BLOCK_SIZE));

    // Provera ukoliko radimo mem_free pre nego sto smo bilo sta alocirali!
    if (initialized == false)return -4;

    // Posto mi dobijamo kao parametar adresu iza koje se nalazi struktura UsedSegment
    // onda mozemo da izvrsimo proveru ukoliko je adr kad se pomeri za velicinu pomenute strukture
    // iza HEAP_START_ADDR to je onda sigurno greska.

    if ((uint64)adr < checker_adr) return -1;

    uint64 checker_end_adr = (uint64)ending_adress;

    // Naravno ukoliko je adresa van opsega date memorije i to je sigurno greska

    if ((uint64)adr >= checker_end_adr) return -2;

    //Pocetak trazenja segmenta koji je dat kao parametar!
    UsedSegment* current = used_head;
    while (current)
    {
        uint64 potential_adr = (uint64)(current) + (uint64)(MEM_BLOCK_SIZE);
        if (potential_adr == (uint64)adr)
        {
            UsedSegment* prev_used = current->prev;
            UsedSegment* next_used = current->next;
            if (prev_used == nullptr)
            {
                used_head = next_used;
            }
            else
            {
                prev_used->next = next_used;
            }
            if (next_used!= nullptr)
            {
                next_used->prev = prev_used;
            }

            FreeSegment* new_free_segment = (FreeSegment*) current;
            new_free_segment->size=current->size;
            new_free_segment->next= nullptr;
            new_free_segment->prev= nullptr;

            // Trazenje moguce kompakcije slobodnih fragmenata;

            uint64 new_free_segment_addr = (uint64)new_free_segment;

            FreeSegment* tmp = free_head;

            if (tmp== nullptr)
            {
                free_head = new_free_segment;
                return 0;
            }

            while (tmp!= nullptr)
            {
                uint64 start_adr = (uint64) tmp + (uint64)(MEM_BLOCK_SIZE);

                if (start_adr<new_free_segment_addr)
                {
                    uint64 length = (uint64)(tmp->size);
                //    length = length * (uint64)MEM_BLOCK_SIZE;

                    // Trazenje za spajanje novog segment sa svojim prethodnikom potencijalnim
                    if (length+start_adr==new_free_segment_addr)
                    {
                        //Nova duzina
                        uint64 new_length = (uint64)(tmp->size) + (uint64) (MEM_BLOCK_SIZE) + (uint64)(new_free_segment->size);

                        //Nov broj memorijskih blokova!

                        tmp->size = (size_t)new_length;
                        new_free_segment->size=(size_t) new_length;
                        new_free_segment->next=tmp->next;
                        new_free_segment->prev=tmp->prev;
                        new_free_segment = tmp;
                        new_free_segment_addr = (uint64)tmp;

                        FreeSegment* novi = tmp->next;

                        if (novi!= nullptr)
                        {

                            length = (uint64)(new_free_segment->size);
                            length = length + (uint64)(MEM_BLOCK_SIZE);

                            // Trazenje za spajanje sa slobodnim segmentom iza novog segmenta
                            if ((uint64) novi == new_free_segment_addr+length)
                            {


                                // Nova duzina je jednaka duzini novog segmenta plus velicina MEM_BLOCK_SIZE plus
                                // duzina slobodnog segmenta na lokaciji tmp!

                                uint64 new_length =  (uint64)(new_free_segment->size) + (uint64)novi->size + (uint64)MEM_BLOCK_SIZE;

                                new_free_segment->size=new_length;

                                if (novi->next!= nullptr)
                                {
                                    novi->next->prev=new_free_segment;
                                }
                                new_free_segment->next = novi->next;

                                return 0;
                            }

                            else
                            {
                                novi->prev=new_free_segment;
                                new_free_segment->next=novi;
                                return 0;
                            }


                        }
                        else
                        {
                            return 0;
                        }

                    }
                    else if (tmp->next== nullptr)
                    {
                        //Dodajemo kao poslednji u listi novi segment!

                        tmp->next=new_free_segment;
                        new_free_segment->prev=tmp;

                        return 0;
                    }


                }


                else if (start_adr>new_free_segment_addr)
                {
                    uint64 length = (uint64)(new_free_segment->size);
                 //   length = length * (uint64)MEM_BLOCK_SIZE;
                    length = length + (uint64)(MEM_BLOCK_SIZE);

                    FreeSegment* prev_node = tmp->prev;
                    FreeSegment* next_node = tmp->next;

                        // Trazenje za spajanje sa slobodnim segmentom iza novog segmenta
                        if ((uint64) tmp == new_free_segment_addr+length)
                        {


                            // Nova duzina je jednaka duzini novog segmenta plus velicina MEM_BLOCK_SIZE plus
                            // duzina slobodnog segmenta na lokaciji tmp!

                            uint64 new_length =  (uint64)(new_free_segment->size) + (uint64)tmp->size + (uint64)MEM_BLOCK_SIZE;

                            new_free_segment->size=new_length;

                            if (prev_node== nullptr)
                            {
                                free_head=new_free_segment;
                            }
                            else
                            {
                                prev_node->next=new_free_segment;
                            }
                            if (next_node!= nullptr)
                            {
                                next_node->prev=new_free_segment;
                            }
                            new_free_segment->prev=prev_node;
                            new_free_segment->next=next_node;
                            return 0;
                        }

                        else
                        {

                            if (prev_node== nullptr)
                            {
                                free_head=new_free_segment;
                            }
                            else
                            {
                                prev_node->next=new_free_segment;
                            }
                            tmp->prev=new_free_segment;
                            new_free_segment->prev=prev_node;
                            new_free_segment->next=tmp;

                            return 0;
                        }
                }

                tmp=tmp->next;
            }


            return 0;
        }
        current=current->next;
    }

    //Nije pronadjen korisceni segment!

    return -3;


}

