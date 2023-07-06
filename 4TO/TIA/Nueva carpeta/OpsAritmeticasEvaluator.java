package operaciones.aritmeticas;

import java.util.ArrayList;
import org.opt4j.core.Objectives;
import org.opt4j.core.Objective.Sign;
import org.opt4j.core.problem.Evaluator;

public class OpsAritmeticasEvaluator implements Evaluator<ArrayList<MathematicalSymbol>> 
{
	public Objectives evaluate (ArrayList<MathematicalSymbol> phenotype) {
		int resultado = Data.numeros[0];
		int numSUM = 0;
		for( int i=0 ; i<phenotype.size();++i)
		{
			switch(phenotype.get(i))
			{
			case PLUS: resultado +=Data.numeros[i+1];++numSUM;break;
			case MINUS: resultado -=Data.numeros[i+1];break;
			case MULTIPLICATION: resultado *=Data.numeros[i+1];break;
			case DIVISION: resultado /=Data.numeros[i+1];break;
			}
			
	}
	
	Objectives objectives = new Objectives();
	objectives.add("Valor objetivo-MIN",Sign.MIN,Math.abs(Data.resultadoObjetivo -resultado));
	objectives.add("Cuenta de +",Sign.MAX, numSUM);
	return objectives;
	}
	
}
