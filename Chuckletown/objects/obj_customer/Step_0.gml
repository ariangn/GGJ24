//default depth
depth = 0;

switch(state)
{
	case CUSTOMER_STATE.ENTERING:
		if(x == target_table.x+16 && y == target_table.y) //if they are at the table
		{	
			//set the table to what it is
			cust_table = target_table;
			state = CUSTOMER_STATE.WANTS_DRINK;
		}
		break;
	case CUSTOMER_STATE.WANTS_DRINK:
		if (drink_pref == "") {
			drink_pref = drink_array[irandom(5)];
			show_debug_message("I want " + drink_pref);
		}
		count_inc_rate--;
		//increase the laugh meter
		if (count_inc_rate <= 0) {
			alarm[0] = inc_rate;
			count_inc_rate = inc_rate;
		}
		if (mood > -mood_min_val) {
			mood = mood - 0.005;
		}
		current_state = check_current_state();
		
		break;
	case CUSTOMER_STATE.SATIATED:
		//ensure cup n stuff is drawn atop the table
		depth = -1;
		
		if (mood < mood_max_val) {
			mood = mood + 0.005;
		}
		current_state = check_current_state();
		
		break;
	case CUSTOMER_STATE.HECKLER:
		break;
}

//increase of decrease laugh meter based on mood
global.laughter += mood;