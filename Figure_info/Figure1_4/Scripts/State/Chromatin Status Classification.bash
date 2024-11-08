java -mx4000M -jar ChromHMM.jar BinarizeBed  chrlen.txt bedfile jihe.txt jihe_binarization

for i in 2 3 4 5 6 7 8;do
    java -jar -Xmx50G  ChromHMM.jar LearnModel -gzip -p 30 -b 200 jihe_binarization ${dir}/output_${i} ${i} Oar_v1.0
done

for tissue in Cartilage Cecum Pituitary_gland Hypothalamus Liver Longissimus_dorsi Rumen Spleen Tailfat;
do
	echo $tissue
	awk -v OFS='\t' '{ if($4=="E1") print $1, $2, $3, "1\t0\t.", $2, $3, "033,158,188" }' ${tissue}_6_segments.bed >> ./dense/${tissue}_6_dense_tmp.bed
	awk -v OFS='\t' '{ if($4=="E2") print $1, $2, $3, "2\t0\t.", $2, $3, "144,201,231" }' ${tissue}_6_segments.bed >> ./dense/${tissue}_6_dense_tmp.bed
	awk -v OFS='\t' '{ if($4=="E3") print $1, $2, $3, "3\t0\t.", $2, $3, "230,111,081" }' ${tissue}_6_segments.bed >> ./dense/${tissue}_6_dense_tmp.bed
	awk -v OFS='\t' '{ if($4=="E4") print $1, $2, $3, "4\t0\t.", $2, $3, "243,162,097" }' ${tissue}_6_segments.bed >> ./dense/${tissue}_6_dense_tmp.bed
	awk -v OFS='\t' '{ if($4=="E5") print $1, $2, $3, "5\t0\t.", $2, $3, "078,171,144" }' ${tissue}_6_segments.bed >> ./dense/${tissue}_6_dense_tmp.bed
	awk -v OFS='\t' '{ if($4=="E6") print $1, $2, $3, "6\t0\t.", $2, $3, "229,229,229" }' ${tissue}_6_segments.bed >> ./dense/${tissue}_6_dense_tmp.bed
	sort -k1,1 -k2,2n  ./dense/${tissue}_6_dense_tmp.bed > ./dense/${tissue}_6_dense.bed
	rm ./dense/${tissue}_6_dense_tmp.bed
done
