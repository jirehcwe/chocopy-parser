package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public class NonLocalDecl extends Declaration {

    public final Identifier variable;

    public NonLocalDecl(Location left, Location right, Identifier variable) {
        super(left, right);
        this.variable = variable;
    }
}
