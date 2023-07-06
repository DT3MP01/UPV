package proyectoElectricidad;
import java.util.Random;
import org.opt4j.core.problem.Creator;
import org.opt4j.core.genotype.IntegerGenotype;

public class proyectoElectricidadCreator  implements Creator<IntegerGenotype> {
	public IntegerGenotype create()
	{
		IntegerGenotype genotype = new IntegerGenotype(0, DatosElectricidad.NUM_TRAMOS);
		genotype.init(new Random(), DatosElectricidad.NUM_PEDIDOS);
		return genotype;
	}
}
