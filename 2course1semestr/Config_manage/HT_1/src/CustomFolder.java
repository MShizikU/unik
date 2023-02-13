import java.util.ArrayList;

public class CustomFolder {

    private CustomFolder rootFolder;
    private String stFolderName;
    private ArrayList<CustomFile> filesList = new ArrayList<>();

    public CustomFolder(CustomFolder rootFolder, String stFolderName){
        this.rootFolder = rootFolder;
        this.stFolderName = stFolderName;
    }

    public CustomFolder getRootFolder(){
        return this.rootFolder;
    }

    public String getFolderName(){
        return this.stFolderName;
    }

    public void addFile(CustomFile newFile){
        filesList.add(newFile);
    }

    public String getFolderPath(){
        if (rootFolder != null){
            return rootFolder.getFolderPath() + "/" + stFolderName;
        }
        else{
            return stFolderName;
        }
    }

    public String showFiles(){
        String result = "";
        for (int i = 0; i < filesList.size(); i++){
            result += "\t" + filesList.get(i).getFileName();
            if( i % 4 == 0){
                result += "\n";
            }
        }
        return result;
    }

}
