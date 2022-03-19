.section .data        
input: .asciz "%d"    
inputl: .asciz "%lf"
outavg: .asciz "The average is: %lf\n"
output: .asciz "The sum is: %lf\n"     
n: .int 0             
s: .double 0             
res: .double 0
avg: .double 0

.section .text       
.globl _main          
_main:                
   pushl $n           
   pushl $input       
   call _scanf        
   add $8, %esp       
   
   movl n, %ecx       
  
loop1:
  
   pushl %ecx         
   
   pushl $res         
   pushl $inputl       
   call _scanf        
   fldl res
   faddl s
   fstpl s
   add $8, %esp 
   popl %ecx         

   

   loop loop1       
   
   pushl s+4         
   pushl s            
   pushl $output      
   call _printf       
   add $12, %esp      
   
  
   fildl n 
   fldl s       
   fdivp %st(0), %st(1)  
   fstpl avg

  

   pushl avg+4
   pushl avg
   pushl $outavg      
   call _printf       
   add $12, %esp      

   ret