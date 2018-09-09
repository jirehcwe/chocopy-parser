package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public class VarDef extends Declaration {
    public final TypedVar var;
    public final Literal value;

    public VarDef(Location left, Location right, TypedVar var, Literal value) {
        super(left, right);
        this.var = var;
        this.value = value;
    }
}
