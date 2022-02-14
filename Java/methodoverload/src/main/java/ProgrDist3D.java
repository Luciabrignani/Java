
import com.mycompany.methodoverload.Tool;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author tss
 */
public class ProgrDist3D {

    /**
     * @param args the coNewClassmmand line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        /*       float x, y, z;
        x = Tool.insNumero("dimmi x:");
        y = Tool.insNumero("dimmi y:");
        z = Tool.insNumero("dimmi z:");
        float distanza = Tool.distanza3D(x, y, z);
        System.out.println("x: :"+ x);
        System.out.println("y: :"+ y);
        System.out.println("z: :"+ z);
        System.out.println("distanza:"+ distanza);
         */
        //chiedo le dimensioni degli array

        int dim2 = (int) Tool.insNumero("dimmi dim2:");
        //creo array con cui lavorare
        int ar2[] = new int[dim2];
        int dim1 = (int) Tool.insNumero("dimmi dim1:");
        int ar1[] = new int[dim1];
        int arOk[] = new int[dim1 + dim2];

        ar1 = Tool.loadDataInt(ar1, 10);
        ar2 = Tool.loadDataInt(ar2, 5);
        arOk = Tool.concatArrays(ar1, ar2);

        System.out.println("primo elemento" + ar1[0]);
        
        int [] file={123,234,354,456,354,234,123,234};
        file= Tool.concatArrays(ar1, file);
        int[]virus ={354,234,123};
        int posvirus= Tool.cercaVirus(file, virus);
        


    }

}
