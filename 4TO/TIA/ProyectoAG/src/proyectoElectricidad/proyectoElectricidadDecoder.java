package proyectoElectricidad;
import java.util.ArrayList;
import org.opt4j.core.problem.Decoder;
import org.opt4j.core.genotype.IntegerGenotype;

public class proyectoElectricidadDecoder implements Decoder<IntegerGenotype,ArrayList<Integer>>{
	public ArrayList<Integer> decode(IntegerGenotype genotype)
	{
		ArrayList<Integer> phenotype = new ArrayList<Integer>();
		for(int i=0;i<genotype.size();i++) 
		{
			phenotype.add(genotype.get(i));
		}
		return phenotype;
	}
	
}
