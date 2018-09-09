package chocopy.common.astnodes;

import java.util.List;

public class Errors extends Node {

    public final List<SyntaxError> errors;

    public Errors(List<SyntaxError> errors) {
        super(null, null);
        this.errors = errors;
    }

    public boolean hasErrors() {
        return !this.errors.isEmpty();
    }

    public void add(SyntaxError err) {
        errors.add(err);
    }
}
