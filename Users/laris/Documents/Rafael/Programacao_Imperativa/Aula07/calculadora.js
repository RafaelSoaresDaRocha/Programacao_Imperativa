// NIVEL 1

function adicionar(a,b){
    return a + b;
}

function subtracao(a,b){
    return a - b;
}

function multiplicacao(a,b){
    return a * b;
}

function divisao(a,b){
    return a / b;
}

// NIVEL 2

console.log ("-------------- Teste de Soma e Subtracao / Calculadora --------------")

console.log(adicionar(1,2))
console.log(subtracao(3,2))

console.log ("-------------- Teste de Multiplicacao / Calculadora --------------")

console.log(multiplicacao(5,4))

console.log ("-------------- Teste de Divisao / Calculadora --------------")

console.log(divisao(20,5))

console.log ("-------------- Teste de Divisao 0 / Calculadora --------------")

console.log(divisao(20,0))

// NIVEL 3

function quadradoDoNumero(a){
return multiplicacao(a,a);
}

function mediaDeTresNumeros(a,b,c){
return adicionar(a,b + c)/3;
}

function calculaPorcentagem(a,b){
    return [multiplicacao(a,b)] / 100;
}

function geradorDePorcentagem(a,b){
return divisao(a,b) * 100;
}

console.log(quadradoDoNumero(5))
console.log(mediaDeTresNumeros(5,5,5))
console.log(calculaPorcentagem(300,15) + "%")
console.log(geradorDePorcentagem(2,200) + "%")