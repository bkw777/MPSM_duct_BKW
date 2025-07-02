// Hotend fan and part cooling duct for Monoprice Select Mini V2 E3D
// CC-BY-SA 2025 Brian K. White
//
// Use the Customizer window to select options.
// <design default> = 40mm fan, no screw inserts, stock heat block
// "BKW" = screw inserts, Triangle Lab CHC cylindrical ceramic heater
// for several values 0 or -1 means automatic or default

hotend_fan_size = 40; // [30,35,40]
hf_w = hotend_fan_size;
screw_hole_inserts = false;
shd = screw_hole_inserts?1:0;
heater_type = "stock"; // ["stock","v6","chc"]


/* [Site Objects] */
show_fans = true;
show_inserts = true;
show_nozzle = true;
show_build_plate = true;
show_carriage = true;
show_jets = true;

/* [Debug Cutaways] */
cutaway_top = false;
cutaway_top_z = 0;
cutaway_bottom = false;
cutaway_bottom_z = 11;
cutaway_left = false;
cutaway_left_x = 0;
cutaway_right = false;
cutaway_right_x = 0;
cutaway_front = false;
cutaway_front_y = -4;
cutaway_back = false;
cutaway_back_y = -4;


/* [Hidden] */
// screw hole sizes [bare,insert]
M2_5 = [2,4];
M3 = [2.5,4.4];
M4 = [3.2,5.6];

/* [Misc] */
clearance_above_print = 2;
fitment_clearance = 0.2;
fc = fitment_clearance;
wall_thickness = 1;
wt = wall_thickness;
small_corner_radius = 1;

top_ledge_style = 2; // [0:"None",1,2,3]

/* [Spring Hooks] */
spring_hook_style = 1; // [0,1]
spring_hook_inset = 6;
hz = spring_hook_inset;
spring_hook_clearance = 3;

/* [Manifold] */
manifold_jets_angle = 30;
manifold_opening_angle = 140;
manifold_jets_diameter = 4;
manifold_jets = 10;

/* [Hotend Fan] */
// hotend fan bolt pattern
hf_bp = 
  (hf_w==30) ? 24 :
  (hf_w==35) ? 29 :
  (hf_w==40) ? 32 :
  (hf_w==50) ? 40 :
  0 ;
//echo("hotend fan size (hf_w)",hf_w);
//echo("hotend fan bolt pattern (hf_bp)",hf_bp);

hotend_fan_screw_hole_diameter = 0;
hf_sid =
  (hotend_fan_screw_hole_diameter>0) ? hotend_fan_screw_hole_diameter :
  (hf_w==30) ? M2_5[shd] :
  (hf_w<=40) ? M3[shd] :
  M4[shd] ;
//echo("hotend fan screw hole id (hf_sid)",hf_sid);

hotend_fan_screw_hole_depth = 0;
hf_sih =
  (hotend_fan_screw_hole_depth) ? hotend_fan_screw_hole_depth :
  (hf_w<50) ? 6 : 8 ;
//echo("hotend fan screw hole depth (hf_sih)",hf_sih);

hotend_fan_corner_radius = -1;
hf_cr = (hotend_fan_corner_radius<0)?(hf_w-hf_bp)/2:hotend_fan_corner_radius;

hotend_fan_flange_elevation = 14;
hf_fz = hotend_fan_flange_elevation;

hotend_fan_flange_thickness = -1;
hf_ft = (hotend_fan_flange_thickness<0)?hf_sih:hotend_fan_flange_thickness;
hf_z = hf_fz + hf_ft;

// hotend fan ID
hf_id = hf_w-wt*2;

hotend_width = 34; // [34:"more room for spring wire",35:"flush with mating hotend part"]

/* [Hidden] */
hotend_fan_thickness = 20;
hf_t = hotend_fan_thickness;

// dimensions of various parts, not customizable options

// hotend cover interface
hew = hotend_width;  // hotend width
heh = 34;  // hotend height
// "hotend block" is the step on the hotend cover interface
hebw = 30; // hotend block width
hebt = 2;  // hotend block thickness

// hotend face (z=0) to center of nozzle
nozzle_y = -14;

// center of hotend fan to nozzle tip
nozzle_z = -42;

bottom_y = nozzle_z+clearance_above_print;

total_h = hebt + hf_z;

// part blower
// facing inlet, outlet down
// relative to motor axle
pb_tlx = -23;  // top left screw
pb_tly = 20;   // top left screw
pb_brx = 20;   // bottom right screw
pb_bry = -18;  // bottom right screw
pb_le = -27.5; // left edge
pb_be = -25.5; // bottom edge
pb_ow = 20;    // outlet width
pb_od = 15;    // outlet depth
pb_oh = 2.5;   // outlet height

/* [Part Blower] */

part_blower_screw_hole_diameter = 0;
pb_sid =
  (part_blower_screw_hole_diameter>0) ? part_blower_screw_hole_diameter :
  M4[shd];
//echo("part blower screw hole id (pb_sid)",pb_sid);

// (M4 insert needs 8)
part_blower_screw_hole_depth = 8;
pb_sih = part_blower_screw_hole_depth;
part_blower_mount_plate_thickness = 3;

part_blower_x = 0;
pb_x = part_blower_x + (hf_w>=40 ? hf_w/2+pb_sih : 20+pb_sih);

part_blower_y = -1;
pb_y = part_blower_y;

part_blower_z = 6;
pb_z = part_blower_z;

/* [Manifold] */
nozzle_clearance_radius = 12;
pd_nr = nozzle_clearance_radius;

// manifold width vs height
//
// any wider than 42mm and it hits the Z tower
max_manifold_width = 42;

// Option A : height is blower output depth
//part_cooler_manifold_width = 40;
//pd_mw = part_cooler_manifold_width;
//part_cooler_manifold_height = 0;
//pd_mh = (part_cooler_manifold_height?part_cooler_manifold_height:pb_od);
//
// Option B : height derived from width minus nozzle clearance
part_cooler_manifold_width = max_manifold_width;
pd_mw = part_cooler_manifold_width;
part_cooler_manifold_height = 0;
pd_mh = (part_cooler_manifold_height?part_cooler_manifold_height:pd_mw/2-pd_nr);
//
// Option C : width derived from nozzle clearance plus height
//part_cooler_manifold_height = 0;
//pd_mh = (part_cooler_manifold_height?part_cooler_manifold_height:pb_od);
//part_cooler_manifold_width = 0;
//pd_mw = (part_cooler_manifold_width?part_cooler_manifold_width:(pd_nr+pd_mh)*2);
//
// Option D : width derived from fan width plus blower mount height
// pd_mw comes out to 56, which is too wide, hits the Z tower
//part_cooler_manifold_height = 0;
//pd_mh = (part_cooler_manifold_height?part_cooler_manifold_height:pb_od);
//part_cooler_manifold_width = 0;
//pd_mw = (part_cooler_manifold_width?part_cooler_manifold_width:hf_w+pb_sih*2);

//echo ("manifold width:",pd_mw);
assert(pd_mw<=max_manifold_width,"Manifold width > 42mm hits the Z tower!");

// TODO shift 50mm fan off center to avoid hitting Z tower

/* [Part Duct] */
part_cooler_duct_fillet_radius = 4;
pd_fr = part_cooler_duct_fillet_radius;
pillar_diameter = 5;
pillar_chamfer = 1;
pillar_y = -4;

/* [Hidden] */
e = 0.01;
//$fa = 1;
//$fs = $preview?0.6:0.4;
$fn = 72;

module fan () {
  stl =
    hf_w==30 ? "lib/fan3010.stl" :
    hf_w==35 ? "lib/fan3510.stl" :
    hf_w==40 ? "lib/fan4020.stl" :
    "";
  if (stl) import(stl);
}

module blower () {
  import("lib/blower5015.stl");
}

module m3insert () {
  translate([0,0,hf_sih]) rotate([180,0,0]) import("lib/insert_m3.stl");
}

module m4insert () {
  translate([0,0,pb_sih]) rotate([180,0,0]) import("lib/insert_m4.stl");
}

module mirror_copy(v = [1, 0, 0]) {
  children();
  if (v[0]||v[1]||v[2]) mirror(v) children();
}

module qc (w=10,d=10,h=10,r=1) {
  mirror_copy([0,1,0]) translate([0,d/2,0])
    mirror_copy([1,0,0]) translate([w/2,0,0])
      cylinder(h=h,r=(r<e?e:r));
}

module sqylinder(w=10,d=10,h=10,r=1) {
  if (r<=0) translate([-w/2,-d/2,0]) cube([w,d,h]);
  else hull() qc(w=w-r*2,d=d-r*2,h=h,r=r);
}

module fan_flange (w,s,h,r,d,t=wt) {
  ch = h+2*e;
  id = w-2*t;
  difference() {
    sqylinder(w=w,d=w,h=h,r=r);
    translate([0,0,-e]) {
      qc(w=s,d=s,h=ch,r=d/2);
      cylinder(d=id,h=ch);
    }
  }
}

module taurus(R=10,r=4,A=360,a=0){
  rotate_extrude(angle=A,start=a) translate([R-r,0,0]) circle(r=r);
}

module nozzle () {
  //nozzle
  pd = 1.25; // point diameter
  ph = 2;    // point height
  hh = (heater_type=="stock"?2:3);    // hex height
  cylinder(d1=pd,d2=pd+2*ph,h=ph);
  translate([0,0,ph]) cylinder(d=8.1,h=hh,$fn=6);

  // heat block
  if (heater_type=="v6") {
    w = 16;
    d = 23;
    h = 12;
    s = 1.5; // sock thickness
    i = 8; // inset, nozzle to edge
    translate([0,d/2-8,h/2+ph+hh])
      cube([w+2*s,d+2*s,h+2*s],center=true);
  } else if (heater_type=="chc") {
    translate([0,0,ph+hh])
      cylinder(d=15,h=12);
  } else {
    // stock
    w = 15;
    d = 16;
    h = 12;
    b = 1.5; // blanket thickness
    i = 4; // inset (nozzle to edge)
    translate([w/2,d/2-i,h/2+ph+hh])
      rotate([-90,0,90])
        sqylinder(w=d+2*b,d=h+2*b,h=w,r=b);
  }

}

module carriage () {
  w = 35;
  d = 20;
  h = 50;
  y = 14; // nozzle to front of carriage
  z = 10; // nozzle to bottom of carriage
  r = 8;
  hull() {
    translate([-w/2,y+d-e,z]) cube([w,e,e]);
    translate([-w/2,y+d-e,z+h-e]) cube([w,e,e]);
    translate([-w/2,y,z+h-e]) cube([w,e,e]);
    translate([-w/2,r+y,r+z]) rotate([0,90,0]) cylinder(r=r,h=w);
  }
}


//////////////////////////////////////////////////////////////////////////////////

module hotend_fan_duct() {
  if(show_fans) translate([0,0,hf_z]) %fan();
  if(screw_hole_inserts && show_inserts) {
    if(hf_sid>4&&hf_sid<5) mirror_copy([0,1,0]) mirror_copy([1,0,0]) translate([hf_bp/2,hf_bp/2,hf_z-hf_sih]) %m3insert();
    if(hf_sid>5&&hf_sid<6) mirror_copy([0,1,0]) mirror_copy([1,0,0]) translate([hf_bp/2,hf_bp/2,hf_z-hf_sih]) %m4insert();
  }

  difference() {
    // add
    group() {
      r=small_corner_radius;
      hull() {
        // hotend fan flange
        h = (hf_w<=hew)?e:hf_ft;
        translate([0,0,hf_z-h])
          qc(w=hf_w-hf_cr*2,d=hf_w-hf_cr*2,h=h,r=hf_cr);
        // transition
        z = (hf_w<=hew)? hf_fz : hz+spring_hook_clearance ;
        translate([0,0,z-e])
          qc(w=hew-r-r,d=heh-r-r,h=e,r=r);
      }
      // hotend interface
      translate([0,0,-hebt+fc]) hull() qc(w=hew-r-r,d=heh-r-r,h=hebt+hf_fz-fc,r=r);
      // top ledge
      tll = hebw/2;
      if (top_ledge_style==1) hull () {
        translate([-tll/2,heh/2-e,-hebt]) cube([tll,hebt+e,hebt*2]);
        translate([-tll/2,heh/2-e,hebt*2]) cube([tll,e,e]);
      } else if (top_ledge_style==2) translate([-tll/2,heh/2,0]) rotate([0,90,0]) cylinder(r=hebt,h=tll);
      else if (top_ledge_style==3) translate([-tll/2,heh/2,-hebt]) cube([tll,hebt,hebt+hf_fz]);
      
      // spring hooks
      hw = 3.5; // hook width
      hh = (spring_hook_style==0)?5:3;   // hook height
      bz = hz-hh; // boss z

      // hard code boss width to 40 so it's flush with a 40mm fan,
      // but having it match other fan sizes won't work
      bw = 40;

      if (spring_hook_style==0) {
        // boss
        hull() {
          translate([-bw/2,-hw/2,bz]) cube([bw,hw,hh]);
          translate([-hew/2,-hw*1.5,bz]) cube([hew,1,hh]);
        }
        mirror_copy([1,0,0]) {
          // hook      
          hull() {
            translate([bw/2-1,0,bz+hh+1]) rotate([0,90,0]) cylinder(d=hw,h=1);
            translate([bw/2-1,-hw/2,bz]) cube([1,hw,hh]);
          }
        }
      } else if (spring_hook_style==1) {

        // boss
        hull() {
          translate([-bw/2,-hw/2,bz]) cube([bw,hw,hh]);
          translate([-hew/2-e,-hw/2,bz-(bw-hew)/2]) cube([hew+e+e,hw,1]);
        }
        // if fan width less than the boss, then add a front boss
        if (hf_w<bw) hull() {
          translate([-bw/2,-hw/2,hf_fz-hh]) cube([bw,hw,1]);
          translate([-hew/2,-hw/2,hf_fz-1]) cube([hew,hw,1]);
        }        
        // hook
        hl = (hf_w<bw)? hf_fz-hz-hh:hf_fz-hz;
        mirror_copy([1,0,0]) translate([bw/2-1,-hw/2,hz-e]) cube([1,hw,hl+e+e]);
      }

    }

    // cut
    group() {
      // fan screw insert pockets
      // deferred, cut later after the blower mount is added
      //translate([0,0,hf_z-hf_sih]) qc(w=hf_bp,d=hf_bp,h=hf_sih+e,r=hf_sid/2);
      
      // hotend interface slot
      translate([-hebw/2-fc,-heh/2-e-fc,-hebt-e]) cube([hebw+fc*2,heh+e*2+fc*2,hebt+e]);
      
      // funnel
      // fan
      translate([0,0,hf_fz+wt]) cylinder(d=hf_id,h=hf_ft-wt+e);
      // transition
      translate([0,0,hf_fz/2+wt]) cylinder(d1=hebw,d2=hf_id,h=hf_fz/2+e);
      // hotend
      translate([0,0,-hebt-e]) cylinder(d=hebw,h=e+hebt+hf_fz/2+wt+e);

    }
  }
}


module part_blower_mount() {
  // drawn in the same orientation as the blower model
  // inlet face is +Z, outlet face is -Y

  if(show_fans) %blower();
  if (screw_hole_inserts&&show_inserts&&pb_sid>5&&pb_sid<6) translate([0,0,-pb_sih]) {
    translate([pb_tlx,pb_tly,0]) %m4insert();
    translate([pb_brx,pb_bry,0]) %m4insert();
  }


  bd = pb_sid+4;
  pw = pb_brx-pb_tlx;
  pd = pb_tly-pb_bry;
  pt = part_blower_mount_plate_thickness;

  difference() {
    // add
    group() {
      top_of_manifold = bottom_y-pb_y+pd_mh-wt;
      descender_height = pb_be-top_of_manifold+pb_oh;
      // top-left screw boss
      translate([pb_tlx,pb_tly,-pb_sih]) {
        cylinder(d=bd,h=pb_sih);
        hull() {
          sphere(d=bd);
          translate([0,-pb_tly-pb_y+hf_bp/2,pb_sih-pb_x+hf_bp/2]) sphere(r=hf_cr);
        }
      }
      // bottom-right screw boss
      translate([pb_brx,pb_bry,-pb_sih]) cylinder(d=bd,h=pb_sih);
      // plate
      translate([pb_tlx,pb_bry,-pb_sih]) {
        cylinder(d=bd,h=pb_sih);
        hull() {
          sphere(d=bd);
          translate([0,-pb_bry-pb_y-hf_bp/2,pb_sih-pb_x+hf_bp/2]) sphere(r=hf_cr);
        }
      }
      hull() {
        // triangle in corner for fillet to cut away
        // don't go all the way to the ends
        translate([pb_tlx,pb_tly-bd*2,-pt]) cylinder(d=bd,h=pt);
        translate([pb_tlx,pb_bry,-pt]) cylinder(d=bd,h=pt);
        translate([pb_brx-bd*2,pb_bry,-pt]) cylinder(d=bd,h=pt);
      }
      hull() {
        // top left
        translate([pb_tlx,pb_tly,-pt]) cylinder(d=bd,h=pt);
        translate([pb_tlx,pb_bry,-pt]) cylinder(d=bd,h=pt);
      }
      // bottom right
      hull() {
        translate([pb_tlx,pb_bry,-pt]) cylinder(d=bd,h=pt);
        translate([pb_brx,pb_bry,-pt]) cylinder(d=bd,h=pt);
        translate([pb_le-wt,top_of_manifold-e,-pt]) cube([pb_ow+2*wt,descender_height,pt]);
      }
    }

    // cut
    group() {
      // top-left screw insert pocket
      translate([pb_tlx,pb_tly,-pb_sih-e]) cylinder(d=pb_sid,h=pb_sih+2*e);
      // bottom-right screw insert pocket
      translate([pb_brx,pb_bry,-pb_sih-e]) cylinder(d=pb_sid,h=pb_sih+2*e);
      // plate
      translate([bd,bd,-pt-e]) hull() {
        translate([pb_tlx,pb_tly,0]) cylinder(d=bd,h=pt+2*e);
        translate([pb_brx,pb_bry,0]) cylinder(d=bd,h=pt+2*e);
        translate([pb_tlx,pb_bry,0]) cylinder(d=bd,h=pt+2*e);
      }
    }
  }

}

module part_blower_duct(cut=false) {

  c = cut?wt:0; // cut by wall thickness, or nothing
  g = cut?0:wt;   // grow by wall thickness, or nothing

  pdmw = pd_mw-2*c;
  pdmhw = pdmw/2;
  pdmh = pd_mh-2*c;
  pdmhh = pdmh/2;

  blower_connector_height = -bottom_y+pb_be+pb_y-pdmh+pb_oh;

  pbod = pb_od+2*g;
  pbow = pb_ow+2*g;

  manifold_above_z = -pb_z-pb_le-pbow+g;
  manifold_below_z = -nozzle_y+c;
  
  translate([0,bottom_y+c,0]) {
  
    // blower socket
    translate([pb_x-g,pdmh-e,-pbow-pb_z-pb_le+g])
      cube([pbod,blower_connector_height,pbow]);

    // blower to manifold
    hull() {
    translate([-pd_mh+pb_x+pb_od+wt,pd_mh-c,-pbow-pb_z-pb_le+g])
        rotate([0,0,-90])
          intersection() {
            cylinder(r=pd_mh-c,h=pbow);
            translate([c,0,-e]) cube([pdmh+e,pd_mh-c+e,pbow+2*e]);
          }
    translate([0,0,-pbow-pb_z-pb_le+g]) cube([e,pdmh,pbow]);
      translate([0,0,-pbow-pb_z-pb_le+g]) {
        rotate([-90,0,0]) intersection() {
          //translate([-(pdmhw-pbow),0,0]) #cylinder(r=pbow,h=pdmh);
          r = pb_ow+g; // pbow but only one g
          //translate([-(pd_mw/2-pb_ow)+wt,-g,0]) #cylinder(r=r,h=pdmh);
          translate([r-pd_mw/2+c,-g,0]) cylinder(r=r,h=pdmh);
          //translate([r-pd_mw/2+c,-g,0]) #cylinder(r=r,h=pdmh);
          translate([-pdmhw-e,-pbow-e,-e]) cube([pdmw+e,pbow+e,pdmh+2*e]);
        }
      }
    }

    // duct to manifold
    translate([-pdmhw+pdmhh,0,-manifold_below_z+(cut?c+wt:0)])
      cube([pdmw-pdmh,pdmh,manifold_below_z+manifold_above_z+e]);

    mirror_copy([1,0,0]) hull() {
      translate([-pdmhw+pdmhh,pdmhh,-manifold_below_z+c-c*e])
        cylinder(d=pdmh,h=e+c*e);
      o = pd_fr-manifold_above_z+0.5;
      translate([-pdmhw,0,-c*0.9-o])
        cube([pdmh,pdmh,manifold_above_z+wt+o]);
    }

    if (cut) {
      translate([0,-wt-e,nozzle_y])
        rotate([-90,0,0])
          cylinder(r=pd_nr+pd_mh/2,h=pd_mh+2*e);
      mirror_copy([1,0,0])
        translate([pd_nr+pd_mh/2,pd_mh/2-wt,nozzle_y-e])
          cylinder(r=pd_mh/2-wt,h=wt+2*e);
    }

    // pillar
    if (!cut) {
      sep = hew/2-pillar_diameter/2-pillar_chamfer-small_corner_radius;
      mirror_copy([1,0,0]) translate([sep,0,0])  // just comment this line to make it one in the center, but it lands in the donut hole
      rotate([-90,0,0]) {
        ch = pillar_chamfer;
        pd = pillar_diameter;
        pt = -bottom_y-heh/2; // top
        pb = pd_mh;  // bottom
        ph = pt-pb;  // height
        translate([0,pillar_y,-ch+pt+e]) cylinder(d1=pd,d2=pd+2*ch,h=ch);
        translate([0,pillar_y,pb-e]) cylinder(d=pd,h=ph+2*e);
        translate([0,pillar_y,pb-e]) cylinder(d1=pd+2*ch,d2=pd,h=ch);
      }
    }

  }

}

module manifold () {
  if (show_nozzle) translate([0,0,-clearance_above_print]) %nozzle();
  if (show_carriage) translate([0,0,-clearance_above_print]) %carriage();
  if (show_build_plate) translate([0,0,-0.5-clearance_above_print]) %cube([80,80,1],center=true);

  R = pd_nr+pd_mh;
  r = pd_mh/2;
  A = manifold_opening_angle>40?manifold_opening_angle:0;
  a = A/2;
  
  difference() {
    // ADD
    // outer toaurus
    translate([0,0,r]){
      taurus(R=R,r=r,A=360-A,a=90+a);
      if (A) {
        rotate([0,0,90+a]) translate([pd_nr+r,0,0]) sphere(r=r);
        rotate([0,0,90-a]) translate([pd_nr+r,0,0]) sphere(r=r);
      }
    }
    // CUT
    group() {
      // inner taurus
      translate([0,0,r]){
        taurus(R=R-wt,r=r-wt,A=360-A,a=90+a);
        if (A) {
          rotate([0,0,90+a]) translate([pd_nr+r,0,0]) sphere(r=r-wt);
          rotate([0,0,90-a]) translate([pd_nr+r,0,0]) sphere(r=r-wt);
        }
      }

      // cut away the outside part of the taurus facing the duct
      difference() {
        translate([-R-e,-R-e,-e]) cube([R*2+2*e,R,pd_mh+2*e]);
        translate([0,0,-2*e]) cylinder(r=pd_nr+r+e,h=pd_mh+4*e);
      }

      // clip the sides to the overall width      
      //*mirror_copy([1,0,0])
      //  translate([pd_mw/2-e,nozzle_y+e,-e])
      //    cube([pd_mh,R*2,pd_mh+2*e]);

      // jets
      jp = (360-A)/(manifold_jets-(A?1:0));
      jd = manifold_jets_diameter;
      jh = pd_nr+pd_mh/2;
      jy = pd_nr+pd_mh/2;
      jz = pd_mh/2;
      ja = 90+manifold_jets_angle;
      for (i = [ a : jp : 360-a ]) {
        rotate([0,0,i])
          translate([0,jy,jz])
            rotate([ja,0,0]) {
              cylinder(d=jd,h=jh);
              if (show_jets) %cylinder(d=jd,h=jh);
            }
      }

    }
  }
}

module all () {

  difference() {

    // ADD //
    group() {
      // hotend fan duct
      hotend_fan_duct();

      // part blower mount
      translate([pb_x,pb_y,-pb_z])
        rotate([0,90,0])
          part_blower_mount();

      // part blower duct
      difference() {
        part_blower_duct();
        part_blower_duct(cut=true);
      }
      
      // manifold
      translate([0,bottom_y,nozzle_y])
        rotate([-90,0,0])
          manifold();

      // fillets
      //translate([-pd_fr+hf_w/2+pb_sih-part_blower_mount_plate_thickness,bottom_y+pd_mh-e,-pb_z-pb_le-pb_ow-wt])
      translate([pb_x-pd_fr-part_blower_mount_plate_thickness,bottom_y+pd_mh-e,-pb_z-pb_le-pb_ow-wt])
      difference() {
        cube([pd_fr+e,pd_fr+e,pb_ow+2*wt]);
        translate([0,pd_fr,-e]) cylinder(r=pd_fr,h=pb_ow+2*wt+2*e);
      }
      translate([pd_mw/2,bottom_y,-pb_z-pb_le-pb_ow-wt+e])
      rotate([-90,0,0])
      difference() {
        cube([pd_fr+e,pd_fr+e,pd_mh]);
        translate([pd_fr,pd_fr,-e]) cylinder(r=pd_fr+e/2,h=pd_mh+2*e);
      }

    }

    // CUT //
    // cut hotend fan and screw holes
    // after adding other parts that intrude into the area
    group() {
      translate([0,0,hf_z-e]) {
        sqylinder(w=hf_w+2*fc,d=hf_w+2*fc,h=hf_t,r=hf_cr-fc); // sharpen the corners slightly
        translate([0,0,-hf_sih]) qc(w=hf_bp,d=hf_bp,h=hf_sih+e,r=hf_sid/2);
        translate([0,0,-hf_ft+1.1]) cylinder(d=hf_id,h=hf_ft);
      }

      // fillets
      translate([pb_x-pd_fr,bottom_y+pd_mh-wt-2*e,-pb_z-pb_le-pb_ow])
      difference() {
        cube([pd_fr+e,pd_fr+e,pb_ow]);
        translate([0,pd_fr,-e]) cylinder(r=pd_fr,h=pb_ow+2*e);
      }
      translate([pd_mw/2-wt-e,bottom_y+wt,-pb_z-pb_le-pb_ow+e])
      rotate([-90,0,0])
      difference() {
        r = pd_fr+wt;
        cube([r+e,r+e,pd_mh-2*wt]);
        translate([r,r,-wt]) cylinder(r=r,h=pd_mh);
      }

      // debug cutaways
      if ($preview) {
        if (cutaway_top) translate([-50,cutaway_top_z,-50]) cube([100,25-cutaway_top_z,100]);
        if (cutaway_bottom) translate([-50,bottom_y-clearance_above_print-5,-50]) cube([100,cutaway_bottom_z,100]);
        if (cutaway_left) translate([-pd_mw/2-5,bottom_y-clearance_above_print-5,-50]) cube([5+pd_mw/2+cutaway_left_x,100,100]);
        if (cutaway_right) translate([cutaway_right_x,bottom_y-clearance_above_print-5,-50]) cube([50-cutaway_right_x,100,100]);
        if (cutaway_front) translate([-50,bottom_y-clearance_above_print-5,-cutaway_front_y]) cube([100,100,hf_z+10+cutaway_front_y]);
        if (cutaway_back) translate([-50,bottom_y-clearance_above_print-5,-50]) cube([100,100,50-cutaway_back_y]);
      }
    }
  }
}

///////////////////////////////////////////////////////////////////////////////////

// re-orient as thought installed in the printer with nozzle tip at 0,0,0
translate([0,nozzle_y,-bottom_y+clearance_above_print]) rotate([90,0,0])
all();

//sqylinder(w=40,d=40,h=5,r=2);
//fan_flange(w=40,s=32,h=5,r=4,d=3);
