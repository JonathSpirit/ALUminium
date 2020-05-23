/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/guill/Desktop/Creation/electronique/Xilinx/ALUGP8B/main.v";



static void Cont_99_0(char *t0)
{
    char t4[8];
    char t12[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = (t0 + 1368U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = *((unsigned int *)t5);
    t7 = (t7 & 1);
    if (*((unsigned int *)t2) != 0)
        goto LAB4;

LAB5:    t9 = 1;

LAB7:    t10 = (t9 <= 7);
    if (t10 == 1)
        goto LAB8;

LAB9:    *((unsigned int *)t4) = t7;

LAB6:    t13 = *((unsigned int *)t3);
    t14 = *((unsigned int *)t4);
    t15 = (t13 ^ t14);
    *((unsigned int *)t12) = t15;
    t16 = (t3 + 4);
    t17 = (t4 + 4);
    t18 = (t12 + 4);
    t19 = *((unsigned int *)t16);
    t20 = *((unsigned int *)t17);
    t21 = (t19 | t20);
    *((unsigned int *)t18) = t21;
    t22 = *((unsigned int *)t18);
    t23 = (t22 != 0);
    if (t23 == 1)
        goto LAB11;

LAB12:
LAB13:    t26 = (t0 + 2928);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memset(t30, 0, 8);
    t31 = 255U;
    t32 = t31;
    t33 = (t12 + 4);
    t34 = *((unsigned int *)t12);
    t31 = (t31 & t34);
    t35 = *((unsigned int *)t33);
    t32 = (t32 & t35);
    t36 = (t30 + 4);
    t37 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t37 | t31);
    t38 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t38 | t32);
    xsi_driver_vfirst_trans(t26, 0, 7);
    t39 = (t0 + 2848);
    *((int *)t39) = 1;

LAB1:    return;
LAB4:    t8 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t8) = 1;
    goto LAB6;

LAB8:    t6 = (t6 >> 1);
    t11 = (t6 & 1);
    t7 = (t7 ^ t11);

LAB10:    t9 = (t9 + 1);
    goto LAB7;

LAB11:    t24 = *((unsigned int *)t12);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t12) = (t24 | t25);
    goto LAB13;

}


extern void work_m_00000000000988242910_3680866920_init()
{
	static char *pe[] = {(void *)Cont_99_0};
	xsi_register_didat("work_m_00000000000988242910_3680866920", "isim/testbench_isim_beh.exe.sim/work/m_00000000000988242910_3680866920.didat");
	xsi_register_executes(pe);
}
