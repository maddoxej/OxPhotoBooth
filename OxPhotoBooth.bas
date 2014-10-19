@title Ox Photo Booth
@param a start delay (sec)
@default a 3
@param w time between shots (sec)
@default w 3
@param d Debug and timing
@default d 0
@range d 0 1

rem convert seconds to ms
w = w * 1000 

rem Append to CHDK\LOGS\LOG_0002.TXT
if d=1 then
  print_screen -2
endif

let g = get_tick_count
rem 3 ... 2... 1
for n=1 to a
  print a - n + 1, ". . . "
  sleep 990
next n

rem take 4 shots. 
for s=1 to 4
  let r = get_tick_count
  gosub "shot"
rem ensure there is at least some time between shots
  if s < 4 then
    if ( (get_tick_count - r) < w ) then
      sleep (w - (get_tick_count - r)) 
    endif
  endif
next s
end

:shot
if d=1 then
  print "taking shot", s, (get_tick_count - g)
endif

rem just calling "shoot" didn't work. Start focusing
press "shoot_half"

let h = get_tick_count
rem if the flash is manually turned off =2
if get_flash_mode = 2 then 
  do 
    sleep 20
  until get_shooting = 1
else
  do 
    sleep 20
  until (get_shooting = 1) and (get_flash_ready = 1) 
endif 
if d=1 then
  print "Waited",(get_tick_count - h),"ms for focus + flash charge"
endif

rem get_exp_count returns 0 before any shots are taken. then it returns the file number
let e=get_exp_count

press "shoot_full"

rem  hold the button down until it takes the shot. 
let h = get_tick_count
do 
  sleep 10
  let x = get_exp_count
until (x - e) > 0
if d=1 then
  print "Waited",(get_tick_count - h),"ms for shot"
endif

if d=1 then
  print "shot", s, (get_tick_count - g)
else
  print "shot", s
endif
release "shoot_full"
release "shoot_half"
return