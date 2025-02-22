/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//Controlando o player
var _chao = place_meeting(x, y + 1, obj_chao);

var _left, _right, _jump;
_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_jump = keyboard_check_pressed(inputs.jump);

velh = (_right - _left) * vel;

// Variáveis de controle do pulo duplo
if (!variable_instance_exists(id, "jump_count")) {
    jump_count = 0;
}
var max_jumps = 1; // Número máximo de pulos (incluindo o pulo duplo)

// Pulando
if (_chao) {
    if (_jump) {
        velv = -vel_jump;
        jump_count = 1; // Reseta o contador de pulos ao tocar o chão
    }
} else {
    // Aplico a gravidade
    velv += grav;

    // Verifica se o jogador pode pular novamente (pulo duplo)
    if (_jump && jump_count < max_jumps) {
        velv = -vel_jump;
        jump_count += 1;
    }
}

// Reseta o contador de pulos ao tocar o chão
if (_chao) {
    jump_count = 0;
}