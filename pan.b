	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC user */

	case 3: // STATE 2
		;
		_m = unsend(now.user_controller_ch);
		;
		goto R999;

	case 4: // STATE 3
		;
		_m = unsend(now.user_controller_ch);
		;
		goto R999;
;
		;
		
	case 6: // STATE 5
		;
		_m = unsend(now.user_controller_ch);
		;
		goto R999;

	case 7: // STATE 7
		;
		_m = unsend(now.user_controller_ch);
		;
		goto R999;

	case 8: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC machine_controller */

	case 9: // STATE 1
		;
		XX = 1;
		unrecv(now.gate_user_ch, XX-1, 0, 2, 1);
		;
		;
		goto R999;
;
		;
		
	case 11: // STATE 3
		;
		now.items_stock[ Index(now.selected_item, 7) ] = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 5
		;
		_m = unsend(now.gate_controller_ch);
		;
		goto R999;

	case 13: // STATE 8
		;
		XX = 1;
		unrecv(now.gate_user_ch, XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 14: // STATE 9
		;
		_m = unsend(now.gate_controller_ch);
		;
		goto R999;

	case 15: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC gate */

	case 16: // STATE 1
		;
		XX = 1;
		unrecv(now.user_controller_ch, XX-1, 0, 6, 1);
		unrecv(now.user_controller_ch, XX-1, 1, ((int)now.v), 0);
		now.v = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 18: // STATE 5
		;
		_m = unsend(now.gate_user_ch);
		;
		goto R999;

	case 19: // STATE 8
		;
		XX = 1;
		unrecv(now.user_controller_ch, XX-1, 0, 5, 1);
		;
		;
		goto R999;

	case 20: // STATE 9
		;
		_m = unsend(now.gate_user_ch);
		;
		goto R999;

	case 21: // STATE 10
		;
		XX = 1;
		unrecv(now.user_controller_ch, XX-1, 0, 4, 1);
		unrecv(now.user_controller_ch, XX-1, 1, ((int)now.v), 0);
		now.v = trpt->bup.oval;
		;
		;
		goto R999;

	case 22: // STATE 11
		;
		now.selected_item = trpt->bup.oval;
		;
		goto R999;

	case 23: // STATE 15
		;
		p_restor(II);
		;
		;
		goto R999;
	}

