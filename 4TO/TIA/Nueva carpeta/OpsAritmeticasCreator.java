package operaciones.aritmeticas;
import java.util.Random;
import org.opt4j.core.problem.Creator;
import org.opt4j.core.genotype.SelectGenotype;

public class OpsAritmeticasCreator  implements Creator<SelectGenotype<MathematicalSymbol>> {
	public SelectGenotype<MathematicalSymbol> create()
	{
		MathematicalSymbol[] Symbols = {MathematicalSymbol.PLUS,MathematicalSymbol.MINUS,MathematicalSymbol.MULTIPLICATION,MathematicalSymbol.DIVISION};
		SelectGenotype<MathematicalSymbol> genotype = new SelectGenotype<MathematicalSymbol>(Symbols);
		genotype.init(new Random(), Data.numeroSimbolos);
		return genotype;
	}
}
