#TSSA
ls *6_segments.bed | while read id;
do
  echo $id
  b=$(basename $id "_6_segments.bed")
  echo $b
  for state in E1 E2 E3 E4 E5 E6
  do
     grep -w $state $id | sort -k1,1 -k2,2n > "state_variability/"$b"_"$state".bed"

  done
done  

for i in E1 E2 E3 E4 E5 E6
do
cat *$i".bed" |sort -k1,1 -k2,2n > 1.bed
bedtools merge -i 1.bed > "AAGs/"$i"_Gs.bed"
done

ls *E1*bed | while read id;
do
    sort -k1,1 -k2,2n E1_Gs.bed > sorted_E1_Gs.bed
    sort -k1,1 -k2,2n $id > sorted_${id}.bed
    bedtools intersect -a sorted_E1_Gs.bed -b sorted_${id}.bed -c -sorted > "E1_AARegulatory_module/${id%%.*}_Gs_E1.bed"
    rm sorted_E1_Gs.bed sorted_${id}.bed
done


ls *_E1_Gs_E1.bed | while read id;
do
  echo $id
  cat ${id} | cut -f 4 | paste -s >> 2.txt
done
awk '{for(i=1;i<=NF;i++)a[NR,i]=$i}END{for(j=1;j<=NF;j++)for(k=1;k<=NR;k++)printf k==NR?a[k,j] RS:a[k,j] FS}' 2.txt > 3.txt
rm 2.txt
cut  -f 1-3 Cecum_E1_Gs_E1.bed > 5.txt
paste 5.txt 3.txt |sed 's/ /\t/g' >6.txt
cat header.txt 6.txt |sed 's/ /\t/g' > all_E1_TssA_Gs.csv



cat all_E1_TssA_Gs.csv | cut -f 4-12 | awk '{for (i=1; i<=NF; i++) {if ($i > 1) $i = 1} print}' > 3.txt
cat 3.txt | awk '{for(i=1;i<=NF;i++){a[NR]+=$i}print $0,a[NR]}' > 4.txt
cut  -f 1-3 all_E1_TssA_Gs.csv > 5.txt
paste  5.txt 4.txt |sed 's/ /\t/g' > all_E1_Gs_TssA_one_count.csv
cut -f 13 all_E1_Gs_TssA_one_count.csv | sort -u
sed -i '1d' all_E1_Gs_TssA_one_count.csv
cat header.txt all_E1_Gs_TssA_one_count.csv |sed 's/ /\t/g' > all_E1_Gs_TssA_one.csv


cat all_E1_Gs_TssA_one.csv | awk '{if (($4+$5+$6+$7+$8+$9+$10+$11+$12)==9) print $0}' > AA_TSR_E1_Gs/TSR_All_common_E1.txt

cat all_E1_Gs_TssA_one.csv | awk '{if ($4==1 && ($5+$6+$7+$8+$9+$10+$11+$12)==0) print $0}' > AA_TSR_E1_Gs/TSR_Cartilage_E1.txt

cat all_E1_Gs_TssA_one.csv | awk '{if ($5==1 && ($4+$6+$7+$8+$9+$10+$11+$12)==0) print $0}' > AA_TSR_E1_Gs/TSR_Cecum_E1.txt

cat all_E1_Gs_TssA_one.csv  | awk '{if ($6==1 && ($4+$5+$7+$8+$9+$10+$11+$12)==0) print $0}' > AA_TSR_E1_Gs/TSR_Hypophysis_E1.txt

cat all_E1_Gs_TssA_one.csv  | awk '{if ($7==1 && ($4+$5+$6+$8+$9+$10+$11+$12)==0) print $0}' > AA_TSR_E1_Gs/TSR_Hypothalamus_E1.txt

cat all_E1_Gs_TssA_one.csv  | awk '{if ($8==1 && ($4+$5+$6+$7+$9+$10+$11+$12)==0) print $0}' > AA_TSR_E1_Gs/TSR_Liver_E1.txt

cat all_E1_Gs_TssA_one.csv  | awk '{if ($9==1 && ($4+$5+$6+$7+$8+$10+$11+$12)==0) print $0}' > AA_TSR_E1_Gs/TSR_Muscle_E1.txt

cat all_E1_Gs_TssA_one.csv  | awk '{if ($10==1 && ($4+$5+$6+$7+$8+$9+$11+$12)==0) print $0}' > AA_TSR_E1_Gs/TSR_Rumen_E1.txt

cat all_E1_Gs_TssA_one.csv  | awk '{if ($11==1 && ($4+$5+$6+$7+$8+$9+$10+$12)==0) print $0}' > AA_TSR_E1_Gs/TSR_Spleen_E1.txt

cat all_E1_Gs_TssA_one.csv  | awk '{if ($12==1 && ($4+$5+$6+$7+$8+$9+$10+$11)==0) print $0}' > AA_TSR_E1_Gs/TSR_Tailfat_E1.txt

#Other chromatin states use the same processing pipeline.