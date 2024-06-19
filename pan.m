#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC user */
	case 3: // STATE 2 - vending_machine.pml:41 - [user_controller_ch!Cola,v] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (q_full(now.user_controller_ch))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.user_controller_ch);
		sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)now.v)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.user_controller_ch, 0, 6, ((int)now.v), 2);
		if (q_zero(now.user_controller_ch)) { boq = now.user_controller_ch; };
		_m = 2; goto P999; /* 0 */
	case 4: // STATE 3 - vending_machine.pml:42 - [user_controller_ch!Grog,v] (0:0:0 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		if (q_full(now.user_controller_ch))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.user_controller_ch);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)now.v)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.user_controller_ch, 0, 4, ((int)now.v), 2);
		if (q_zero(now.user_controller_ch)) { boq = now.user_controller_ch; };
		_m = 2; goto P999; /* 0 */
	case 5: // STATE 4 - vending_machine.pml:44 - [((v>=items_price[selected_item]))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		if (!((((int)now.v)>=((int)now.items_price[ Index(((int)now.selected_item), 7) ]))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 5 - vending_machine.pml:44 - [user_controller_ch!Cafe] (0:0:0 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		if (q_full(now.user_controller_ch))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.user_controller_ch);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.user_controller_ch, 0, 3, 0, 1);
		if (q_zero(now.user_controller_ch)) { boq = now.user_controller_ch; };
		_m = 2; goto P999; /* 0 */
	case 7: // STATE 7 - vending_machine.pml:45 - [user_controller_ch!PdL] (0:0:0 - 1)
		IfNotBlocked
		reached[2][7] = 1;
		if (q_full(now.user_controller_ch))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.user_controller_ch);
		sprintf(simtmp, "%d", 5); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.user_controller_ch, 0, 5, 0, 1);
		if (q_zero(now.user_controller_ch)) { boq = now.user_controller_ch; };
		_m = 2; goto P999; /* 0 */
	case 8: // STATE 13 - vending_machine.pml:48 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC machine_controller */
	case 9: // STATE 1 - vending_machine.pml:29 - [gate_user_ch?Leche] (0:0:0 - 1)
		reached[1][1] = 1;
		if (q_zero(now.gate_user_ch))
		{	if (boq != now.gate_user_ch) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.gate_user_ch) == 0) continue;

		XX=1;
		if (2 != qrecv(now.gate_user_ch, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.gate_user_ch-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.gate_user_ch, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.gate_user_ch);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.gate_user_ch))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 10: // STATE 2 - vending_machine.pml:31 - [((items_stock[selected_item]>0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!((((int)now.items_stock[ Index(((int)now.selected_item), 7) ])>0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 3 - vending_machine.pml:31 - [items_stock[selected_item] = (items_stock[selected_item]-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		(trpt+1)->bup.oval = ((int)now.items_stock[ Index(((int)now.selected_item), 7) ]);
		now.items_stock[ Index(now.selected_item, 7) ] = (((int)now.items_stock[ Index(((int)now.selected_item), 7) ])-1);
#ifdef VAR_RANGES
		logval("items_stock[selected_item]", ((int)now.items_stock[ Index(((int)now.selected_item), 7) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 5 - vending_machine.pml:32 - [gate_controller_ch!ColaCao] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (q_full(now.gate_controller_ch))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.gate_controller_ch);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.gate_controller_ch, 0, 1, 0, 1);
		if (q_zero(now.gate_controller_ch)) { boq = now.gate_controller_ch; };
		_m = 2; goto P999; /* 0 */
	case 13: // STATE 8 - vending_machine.pml:34 - [gate_user_ch?ColaCao] (0:0:0 - 1)
		reached[1][8] = 1;
		if (q_zero(now.gate_user_ch))
		{	if (boq != now.gate_user_ch) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.gate_user_ch) == 0) continue;

		XX=1;
		if (1 != qrecv(now.gate_user_ch, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.gate_user_ch-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.gate_user_ch, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.gate_user_ch);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.gate_user_ch))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 14: // STATE 9 - vending_machine.pml:34 - [gate_controller_ch!ColaCao] (0:0:0 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		if (q_full(now.gate_controller_ch))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.gate_controller_ch);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.gate_controller_ch, 0, 1, 0, 1);
		if (q_zero(now.gate_controller_ch)) { boq = now.gate_controller_ch; };
		_m = 2; goto P999; /* 0 */
	case 15: // STATE 13 - vending_machine.pml:36 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC gate */
	case 16: // STATE 1 - vending_machine.pml:17 - [user_controller_ch?Cola,v] (0:0:1 - 1)
		reached[0][1] = 1;
		if (q_zero(now.user_controller_ch))
		{	if (boq != now.user_controller_ch) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.user_controller_ch) == 0) continue;

		XX=1;
		if (6 != qrecv(now.user_controller_ch, 0, 0, 0)) continue;
		(trpt+1)->bup.oval = ((int)now.v);
		;
		now.v = qrecv(now.user_controller_ch, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("v", ((int)now.v));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.user_controller_ch);
		sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)now.v)); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.user_controller_ch))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 17: // STATE 2 - vending_machine.pml:19 - [((v<items_price[selected_item]))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((int)now.v)<((int)now.items_price[ Index(((int)now.selected_item), 7) ]))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 5 - vending_machine.pml:20 - [gate_user_ch!Leche] (0:0:0 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (q_full(now.gate_user_ch))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.gate_user_ch);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.gate_user_ch, 0, 2, 0, 1);
		if (q_zero(now.gate_user_ch)) { boq = now.gate_user_ch; };
		_m = 2; goto P999; /* 0 */
	case 19: // STATE 8 - vending_machine.pml:22 - [user_controller_ch?PdL] (0:0:0 - 1)
		reached[0][8] = 1;
		if (q_zero(now.user_controller_ch))
		{	if (boq != now.user_controller_ch) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.user_controller_ch) == 0) continue;

		XX=1;
		if (5 != qrecv(now.user_controller_ch, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.user_controller_ch-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.user_controller_ch, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.user_controller_ch);
		sprintf(simtmp, "%d", 5); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.user_controller_ch))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 20: // STATE 9 - vending_machine.pml:22 - [gate_user_ch!ColaCao] (0:0:0 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (q_full(now.gate_user_ch))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.gate_user_ch);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.gate_user_ch, 0, 1, 0, 1);
		if (q_zero(now.gate_user_ch)) { boq = now.gate_user_ch; };
		_m = 2; goto P999; /* 0 */
	case 21: // STATE 10 - vending_machine.pml:23 - [user_controller_ch?Grog,v] (0:0:1 - 1)
		reached[0][10] = 1;
		if (q_zero(now.user_controller_ch))
		{	if (boq != now.user_controller_ch) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.user_controller_ch) == 0) continue;

		XX=1;
		if (4 != qrecv(now.user_controller_ch, 0, 0, 0)) continue;
		(trpt+1)->bup.oval = ((int)now.v);
		;
		now.v = qrecv(now.user_controller_ch, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("v", ((int)now.v));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.user_controller_ch);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)now.v)); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.user_controller_ch))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 22: // STATE 11 - vending_machine.pml:23 - [selected_item = v] (0:0:1 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		(trpt+1)->bup.oval = ((int)now.selected_item);
		now.selected_item = ((int)now.v);
#ifdef VAR_RANGES
		logval("selected_item", ((int)now.selected_item));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 15 - vending_machine.pml:25 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][15] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

