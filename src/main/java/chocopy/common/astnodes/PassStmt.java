package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public class PassStmt extends Stmt {
    public PassStmt(Location left, Location right) {
        super(left, right);
    }
}
