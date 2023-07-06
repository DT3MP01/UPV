package operaciones.aritmeticas;
import java.util.ArrayList;
import org.opt4j.core.problem.Decoder;
import org.opt4j.core.genotype.SelectGenotype;
public class OpsAritmeticasDecoder 
			implements Decoder<SelectGenotype<MathematicalSymbol>,ArrayList<MathematicalSymbol>>{
	public ArrayList<MathematicalSymbol> decode (SelectGenotype<MathematicalSymbol> genotype)
	{
		ArrayList<MathematicalSymbol> phenotype = new ArrayList<MathematicalSymbol>();
		for(int i=0;i<genotype.size();i++) 
		{
			phenotype.add(genotype.getValue(i));
		}
		return phenotype;
	}
	
}
