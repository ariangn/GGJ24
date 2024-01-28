switch(state)
{
	case CUSTOMER_STATE.ENTERING:
		if(x == target_table.x+16 && y == target_table.y)
		{	
			//set the table to what it is
			cust_table = target_table;
			state = CUSTOMER_STATE.WANTS_DRINK;
		}
		break;
	case CUSTOMER_STATE.WANTS_DRINK:
		count_inc_rate--;
		//increase the laugh meter
		if (count_inc_rate <= 0) {
			alarm[0] = inc_rate;
			count_inc_rate = inc_rate;
		}
		break;
	case CUSTOMER_STATE.SATIATED:
		break;
	case CUSTOMER_STATE.HECKLER:
		break;
}
