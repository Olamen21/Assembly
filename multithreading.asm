.model small     ;chuong trinh chon bo nho small
.stack 100       ; kich thuoc ngan xep la 100 bytes
.data  
CRLF    DB	13, 10, '$'	;ki tu xuong dong
ChaoTay	DB 	'hello!$'
ChaoTa	DB 	'chao ban!$'      

.code
main proc ;thu tuc chinh
    
    ;Khoi tao thanh ghi DS      
    MOV AX, @Data	;Khoi tao thanh ghi DS
    MOV DS, AX      ;Tro thanh ghi DS ve dau doan data
    call thread_function_1    ;Goi ham 1
    
    LEA DX, CRLF;in dau enter va lui vao dau dong
	INT 21H   
    
    call thread_function_2
    
    mov ax, 4C00h
    int 21h 
main endp


thread_function_1 proc 
    
    ; Hien thi chuoi chao tay
    MOV AH, 9                         
	LEA DX, ChaoTay 
	INT 21H  
	ret
thread_function_1 endp   


thread_function_2 proc  
    
    ;hien thi chuoi chao ta
    MOV AH, 9                         
	LEA DX, ChaoTa 
	INT 21H  
	ret
thread_function_2 endp   

 
end