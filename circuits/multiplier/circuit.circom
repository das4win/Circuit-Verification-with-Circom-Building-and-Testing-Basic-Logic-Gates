pragma circom 2.0.0;

/*Gate curcuit Program*/  

template Multiplier2 () {  

   //input signal declaring
      signal input a;
      signal input b;

  //intermediate signal declaring
      signal x;
      signal y;

// output signal declaring
      signal output q;

// Circuit Gate Used
      component andGate = AND();
      component notGate = NOT();
      component orGate = OR();

//declaring inputs to gate
      andGate.a <== a;
      andGate.b <== b;
      notGate.in <== b;

//declaring values to intermediate signal
      x <== andGate.out;
      y <== notGate.out;

//declaring input to OR Gate

      orGate.a <== x;
      orGate.b <== y;

//declaring output of gate to Q signal
      q <== orGate.out; 

}
//Templates USED Of GATES

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}
template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
