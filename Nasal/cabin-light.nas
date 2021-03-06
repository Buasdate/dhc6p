props.globals.initNode("/systems/electrical/outputs/cabin-lights-dim-factor", 0.0);
props.globals.initNode("/systems/electrical/outputs/cabin-lights", 0.0);

var cabinLight = func {   
    var cab_lgt_output = getprop("/systems/electrical/outputs/cabin-lights") /
        23;
    var is_rembrandt = getprop("sim/rendering/rembrandt/enabled");
    var dim_factor = 0.0;
    if (cab_lgt_output > 1 and is_rembrandt==0){
        dim_factor = 1;
    } else if (cab_lgt_output <= 1 and is_rembrandt==0) {
        dim_factor = cab_lgt_output;
    } else {
        dim_factor = 0;
    }
    setprop("/systems/electrical/outputs/cabin-lights-dim-factor",
        dim_factor);
    settimer(cabinLight, 0.1);
};
setlistener("sim/signals/fdm-initialized",cabinLight);
