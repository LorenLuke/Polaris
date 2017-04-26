/mob/living/proc/process_vision()

	if(istype(src, /mob/living/carbon)
		var/thermal = 0
		var/night = 0
		var/meson = 0
		var/object = 0
		var/mob/living/carbon/C = src
		if(istype(src, /mob/living/carbon/human)
			var/mob/living/carbon/human/H = src







	else if (istype(src, /mob/living/silicon)
		var/mob/living/silicon/S = src
	else
		var/mob/living/simple_animal/S = src


/mob/living/proc/process_thermal_vision()


/mob/living/proc/process_night_vision()

/mob/living/proc/process_meson_vision()

/mob/living/proc/process_object_vision()


/mob/living/var/thermal_icon

/mob/living/proc/get_thermal_icon()
	var/img
	if(!icon || !icon_state)

	else
		var/new_icon = icon
		img = image(new_icon, src,











//Medical HUD outputs. Called by the Life() proc of the mob using it, usually.
proc/process_med_hud(var/mob/M, var/local_scanner, var/mob/Alt)
	if(!can_process_hud(M))
		return

	var/datum/arranged_hud_process/P = arrange_hud_process(M, Alt, med_hud_users)
	for(var/mob/living/carbon/human/patient in P.Mob.in_view(P.Turf))
		if(P.Mob.see_invisible < patient.invisibility)
			continue

		if(local_scanner)
			P.Client.images += patient.hud_list[HEALTH_HUD]
			P.Client.images += patient.hud_list[STATUS_HUD]
		else
			var/sensor_level = getsensorlevel(patient)
			if(sensor_level >= SUIT_SENSOR_VITAL)
				P.Client.images += patient.hud_list[HEALTH_HUD]
			if(sensor_level >= SUIT_SENSOR_BINARY)
				P.Client.images += patient.hud_list[LIFE_HUD]
