// 165.8 x 76.7 x 8.8 mm
module movil() {
  cube([165,76,8], true);
}

// 150, 60

// 30, 25

module botella() {
    // Este cilindro es la base de la botella
    cylinder(150, 30, 30, true);
  
    // Trasladamos el cilindro en el eje Z
    // La mitad de lo que mide la botella (75)
    // más la mitad de lo que mide el cuello (15)
    translate([0, 0, 75 + 15]) {
        cylinder(30, 12.5, 12.5, true);
    }
    
    translate([0, 0, 75 + 30 + 9]) {
        cylinder(18, 14, 14, true);
    }
}

module forat() {
    cylinder(600, 5, 5, true);
}


module body() {
    movil();
    translate([0,0,75 + 4]) {   
        botella();    
    }
}

body();
forat();

