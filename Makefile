.DEFAULT_GOAL := all

EX00 = ft_strdup
EX01 = ft_range
EX02 = ft_ultimate_range
EX03 = ft_strjoin
EX04 = ft_convert_base
EX042 = ft_convert_base2
EX05 = ft_split

norminette:
	-norminette ./ex00/${EX00}.c
	-norminette ./ex01/${EX01}.c
	-norminette ./ex02/${EX02}.c
	-norminette ./ex03/${EX03}.c
	-norminette ./ex04/${EX04}.c
	-norminette ./ex04/${EX042}.c
	-norminette ./ex05/${EX05}.c

 compile: norminette
compile:
	-gcc ./ex00/${EX00}.c test_ex00_${EX00}.c -Wall -Werror -Wextra -o test_ex00_${EX00}
	-gcc ./ex01/${EX01}.c test_ex01_${EX01}.c -Wall -Werror -Wextra -o test_ex01_${EX01}
	-gcc ./ex02/${EX02}.c test_ex02_${EX02}.c -Wall -Werror -Wextra -o test_ex02_${EX02}
	-gcc ./ex03/${EX03}.c test_ex03_${EX03}.c -Wall -Werror -Wextra -o test_ex03_${EX03}
	-gcc ./ex04/${EX042}.c ./ex04/${EX04}.c test_ex04_${EX04}.c -Wall -Werror -Wextra -o test_ex04_${EX04}
	-gcc ./ex05/${EX05}.c test_ex05_${EX05}.c -Wall -Werror -Wextra -o test_ex05_${EX05}

build-sample: compile
	-./test_ex00_${EX00} | awk -v col=7 '{print $$1, $$2, $$3, $$4, $$5, $$6, $$7, $$8}' > result_sample_ex00_${EX00}.txt
	-./test_ex01_${EX01} > result_sample_ex01_${EX01}.txt
	-./test_ex02_${EX02} > result_sample_ex02_${EX02}.txt
	-./test_ex03_${EX03} > result_sample_ex03_${EX03}.txt
	-./test_ex04_${EX04} > result_sample_ex04_${EX04}.txt
	-./test_ex05_ft_split "aaa,bbb,ccc" "," > result_sample_ex05_ft_split_case_1.txt
	-./test_ex05_ft_split "aaa,bbb,ccc ddd,eee" "," > result_sample_ex05_ft_split_case_2.txt
	-./test_ex05_ft_split "aaa,bbb,ccc ddd,eee" ", " > result_sample_ex05_ft_split_case_3.txt
	-./test_ex05_ft_split "ImtmVrV6Ov8QrkGGUglBy7Vgsu iIsdl5XyT35Czv4xeu" "yenORYQ" > result_sample_ex05_ft_split_case_4.txt
	-./test_ex05_ft_split "SJLoauIorpGcYMqTxOURsOVhv6P9gQB" "4JTWPF" > result_sample_ex05_ft_split_case_5.txt
	-./test_ex05_ft_split "ahndmogPrPMOYdq8cMiedFXINbb2USdhwyidNv0 9T" "hRf" > result_sample_ex05_ft_split_case_6.txt

run:	compile
	-./test_ex00_${EX00} | awk -v col=7 '{print $$1, $$2, $$3, $$4, $$5, $$6, $$7, $$8}' > result_current_ex00_${EX00}.txt
	-./test_ex01_${EX01} > result_current_ex01_${EX01}.txt
	-./test_ex02_${EX02} > result_current_ex02_${EX02}.txt
	-./test_ex03_${EX03} > result_current_ex03_${EX03}.txt
	-./test_ex04_${EX04} > result_current_ex04_${EX04}.txt
	-./test_ex05_ft_split "aaa,bbb,ccc" "," > result_current_ex05_ft_split_case_1.txt
	-./test_ex05_ft_split "aaa,bbb,ccc ddd,eee" "," > result_current_ex05_ft_split_case_2.txt
	-./test_ex05_ft_split "aaa,bbb,ccc ddd,eee" ", " > result_current_ex05_ft_split_case_3.txt
	-./test_ex05_ft_split "ImtmVrV6Ov8QrkGGUglBy7Vgsu iIsdl5XyT35Czv4xeu" "yenORYQ" > result_current_ex05_ft_split_case_4.txt
	-./test_ex05_ft_split "SJLoauIorpGcYMqTxOURsOVhv6P9gQB" "4JTWPF" > result_current_ex05_ft_split_case_5.txt
	-./test_ex05_ft_split "ahndmogPrPMOYdq8cMiedFXINbb2USdhwyidNv0 9T" "hRf" > result_current_ex05_ft_split_case_6.txt

all:	norminette	compile run

test:	all
	-diff result_current_ex00_${EX00}.txt result_sample_ex00_${EX00}.txt
	-diff result_current_ex01_${EX01}.txt result_sample_ex01_${EX01}.txt
	-diff result_current_ex02_${EX02}.txt result_sample_ex02_${EX02}.txt
	-diff result_current_ex03_${EX03}.txt result_sample_ex03_${EX03}.txt
	-diff result_current_ex04_${EX04}.txt result_sample_ex04_${EX04}.txt
	-diff result_current_ex05_ft_split_case_1.txt result_sample_ex05_ft_split_case_1.txt
	-diff result_current_ex05_ft_split_case_2.txt result_sample_ex05_ft_split_case_2.txt
	-diff result_current_ex05_ft_split_case_3.txt result_sample_ex05_ft_split_case_3.txt
	-diff result_current_ex05_ft_split_case_4.txt result_sample_ex05_ft_split_case_4.txt
	-diff result_current_ex05_ft_split_case_5.txt result_sample_ex05_ft_split_case_5.txt
	-diff result_current_ex05_ft_split_case_6.txt result_sample_ex05_ft_split_case_6.txt

clean:
	-rm -rf */*.out
	-rm -rf result_current_ex*.txt
	-rm test_ex00_${EX00}
	-rm test_ex01_${EX01}
	-rm test_ex02_${EX02}
	-rm test_ex03_${EX03}
	-rm test_ex04_${EX04}
	-rm test_ex05_${EX05}

clean-sample:
	-rm -rf result_sample_ex*.txt

clean-before-push-with-sample: clean
	-git add .
	-git commit -m "Build Sample Complete"
	-git push origin master
