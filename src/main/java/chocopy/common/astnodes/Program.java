package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

import java.util.ArrayList;
import java.util.List;

public class Program extends Node {

    public final List<Declaration> declarations;
    public final List<Stmt> statements;

    public Program(Location left, Location right, List<Declaration> declarations, List<Stmt> statements) {
        super(left, right);
        this.declarations = declarations;
        this.statements = statements;
    }
}
