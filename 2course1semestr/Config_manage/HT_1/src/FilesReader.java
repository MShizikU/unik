import java.io.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class FilesReader {

    public void getInfoFromZip(CustomFolder rootFolder){
        CustomFolder currentFolder = rootFolder;
        try (
                ZipInputStream zin = new ZipInputStream(new FileInputStream("D:/1.zip"));
        ) {
            ZipEntry entry;
            String name;
            long size;
            while ((entry = zin.getNextEntry()) != null) {
                if (entry.isDirectory()) {
                    currentFolder = new CustomFolder(currentFolder, entry.getName());
                }
                else {
                    CustomFile tmpFile = new CustomFile(currentFolder, entry.getName(), copyData(zin));
                    System.out.println("Дирректория: " + currentFolder.getFolderName());
                    System.out.printf("Название: %s \t текст: %s \n", tmpFile.getFileName(), tmpFile.getFileText());
                }
            }
        } catch (Exception ex) {

            System.out.println(ex.getMessage());
        }
    }


    private static String copyData(InputStream in) throws Exception {
        String result = "";
        BufferedReader br = new BufferedReader(new InputStreamReader(in, "UTF-8"));
        String line= br.readLine();

        while (line!=null){
            result += line + "\n";
            line= br.readLine();
        }
        return result;
    }
}
