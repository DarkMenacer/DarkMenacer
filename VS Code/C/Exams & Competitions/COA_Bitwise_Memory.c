#include <stdio.h>
#include <math.h>

int main(){
    int num_words = 8 * 1024;
    int size_word = 8;
    int word_cache_size = 2 * 1024;
    int word_per_block = 16;
    int i;

    printf("No. of blocks in cache are:- ");
    printf("%d\n",word_cache_size >> (int)log2(word_per_block));

    printf("No. of bits required for word is:- ");
    int bits_word = (int)log2(word_per_block);
    printf("%d\n",bits_word);

    printf("No. of bits required for block is:- ");
    int bits_block = (int)log2(word_cache_size >> (int)log2(word_per_block));
    printf("%d\n",bits_block);

    int pa = (int)log2(num_words);
    printf("No. of bits for tag is:- ");
    int bits_tag = pa - bits_word - bits_block;
    printf("%d\n",bits_tag);

    printf("\n\n\n");

    printf("Enter Memory Address:- ");
    int mem_adrs;
    scanf("%d",&mem_adrs);

    int binary[pa];
    int flag = 0;

    for(i=pa-1;i>=0;--i){
        binary[i] = mem_adrs % 2;
        mem_adrs/=2;
        if(mem_adrs==1){
            if(flag==0){flag=1;}
            else{mem_adrs=0;}
        }
    }

    printf("Word Address is:- ");
    for(i=bits_tag+bits_word;i<pa;++i){printf("%d",binary[i]);}

    printf("\n\n");

    printf("Block Address is:- ");
    for(i=0;i<bits_word+bits_tag;++i){printf("%d",binary[i]);}

    return 0;
}