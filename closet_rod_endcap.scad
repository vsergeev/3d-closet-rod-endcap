/********************************************************
 * Closet Rod Endcap - vsergeev
 * https://github.com/vsergeev/3d-closet-rod-endcap
 * CC-BY-4.0
 *
 * Release Notes
 *  * v1.0 - 06/20/2023
 *      * Initial release.
 ********************************************************/

// in mm
base_xy_diameter = 32.25;

// in mm
base_xy_z_thickness = 3;

// in mm
insert_xy_diameter = 30.25;

// in mm
insert_xy_thickness = 3;

// in mm
insert_z_height = 10;

/* [Hidden] */

$fn = 100;

overlap_epsilon = 0.01;

/******************************************************************************/
/* 2D Profiles */
/******************************************************************************/

module profile_base_footprint() {
    circle(d = base_xy_diameter);
}

module profile_insert_footprint() {
    difference() {
        circle(d = insert_xy_diameter);
        circle(d = insert_xy_diameter - insert_xy_thickness * 2);
    }
}

/******************************************************************************/
/* 3D Extrusions */
/******************************************************************************/

module endcap() {
    union() {
        linear_extrude(base_xy_z_thickness)
            profile_base_footprint();

        translate([0, 0, base_xy_z_thickness - overlap_epsilon])
            linear_extrude(insert_z_height + overlap_epsilon)
                profile_insert_footprint();
    }
}

/******************************************************************************/
/* Top Level */
/******************************************************************************/

endcap();
