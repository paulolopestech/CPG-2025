/// Step Event

// ----- Defina os sprites “padrão” fora dos IFs -----

// Se estiver olhando para trás (↑), trocamos esses nomes dentro do IF “W”
image_speed = 1;                 // animação ligada enquanto houver movimento

// ----- Movimento horizontal -----
if (keyboard_check(ord("D"))) {
    x += 2;
    sprite_index  = anda;
    image_xscale  = 1;           // virado pra direita
}
else if (keyboard_check(ord("A"))) {
    x -= 2;
    sprite_index  = anda;
    image_xscale  = -1;          // virado pra esquerda
}

// ----- Movimento vertical -----
else if (keyboard_check(ord("S"))) {
    y += 2;
    sprite_index  = anda;        // mesmo sprite de frente
    image_xscale  = 1;           // mantém orientação normal
}
else if (keyboard_check(ord("W"))) {
    y -= 2;

    // Troca “anda/para” para as versões de costas
    sprite_index  = Spr_Rei_Back_Anda;
    para          = Spr_Rei_Back_Idle;
    image_xscale  = 1;
}

// ----- Sem movimento -----
else {
    sprite_index  = para;
    image_speed   = 0;           // pausa animação
    image_index   = 0;
}
