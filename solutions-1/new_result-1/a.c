/*
 * Politecnico di Milano
 * Code created using PandA - Version: PandA 0.9.6-dev - Revision 54160dd7ca3a036f97300344dc772a94036db10f-master
 */
static char __bambu_artificial_var_string_cst_25505[45] = "Compute the factorial of n (n!) from 0 to 7\n";
static char __bambu_artificial_var_string_cst_25570[24] = "Factorial of %d is %d.\n";

#define __builtin_puts _bambu___builtin_puts
int __builtin_puts(const char*__restrict__  s);

int __builtin_puts(const char*__restrict__  s)
{
   char _470;
   int _475;
   char _477;
   char _479;
   char*__restrict__  s_480;
   char*__restrict__  s_481;
   _Bool _6674;
   _Bool _6675;
   char __t__25655_0;
   char*__restrict__  __t__25656_0;
   if(1u) _470 = (*((char*)(s)));
   _6674 = _470 != (0);
   _477 = _470;
   s_481 = s;
   if (_6674)
   {
      BB_LABEL_5:;
      __t__25655_0 = _477;
      __t__25656_0 = s_481;
      /* __t__25656_0 = gimple_phi(<s, BB2>, <s_480, BB5>) */
      /* __t__25655_0 = gimple_phi(<_470, BB2>, <_479, BB5>) */
      _475 = (int) (__t__25655_0);
      __builtin_putchar(_475);
      s_480 = __t__25656_0 + 1;
      if(1u) _479 = (*((char*)(s_480)));
      _6675 = _479 != (0);
      _477 = _479;
      s_481 = s_480;
      if (_6675)
         goto BB_LABEL_5;
   }
   __builtin_putchar(10);
   return 0;
}

int main()
{
   int n_6644;
   unsigned int _6656;
   unsigned int ivtmp_10_6655;
   unsigned int ivtmp_10_6654;
   int n_6645;
   int n_6646;
   int _6647;
   int _6648;
   char* _6667;
   char(* _6671)[45];
   char(* _6673)[24];
   _Bool _6676;
   _Bool _6677;
   _Bool _6678;
   unsigned int __t__25657_0;
   int __t__25658_0;
   int __t__25659_0;
   _6671 = __bambu_artificial_var_string_cst_25505;
   _6667 = (char*) (_6671);
   __builtin_puts(_6667);
   _6673 = __bambu_artificial_var_string_cst_25570;
   ivtmp_10_6655 = 1u;
   BB_LABEL_7_2:;
   __t__25657_0 = ivtmp_10_6655;
   /* __t__25657_0 = gimple_phi(<1u, BB2>, <ivtmp_10_6654, BB9>, <ivtmp_10_6654, BB11>) */
   _6656 = (unsigned int)(__t__25657_0 + (4294967295u));
   n_6644 = (int) (_6656);
   _6678 = __t__25657_0 == (1u);
   _6677 = __t__25657_0 != (8u);
   ivtmp_10_6654 = (unsigned int)(__t__25657_0 + (1u));
   _6647 = 1;
   n_6645 = n_6644;
   if (_6678)
   {
      __builtin_printf(_6673, n_6644, 1);
      ivtmp_10_6655 = ivtmp_10_6654;
         goto BB_LABEL_7_2;
   }
   BB_LABEL_4_2:;
   __t__25658_0 = _6647;
   __t__25659_0 = n_6645;
   /* __t__25659_0 = gimple_phi(<n_6644, BB7>, <n_6646, BB4>) */
   /* __t__25658_0 = gimple_phi(<1, BB7>, <_6648, BB4>) */
   n_6646 = (int)(__t__25659_0 + (-1));
   _6648 = __t__25658_0 * __t__25659_0;
   _6676 = n_6646 == (0);
   n_6645 = n_6646;
   _6647 = _6648;
   if (_6676)
   {}
   else
      goto BB_LABEL_4_2;
   __builtin_printf(_6673, n_6644, _6648);
   if (_6677)
   {
      ivtmp_10_6655 = ivtmp_10_6654;
         goto BB_LABEL_7_2;
   }
   return 0;
}


