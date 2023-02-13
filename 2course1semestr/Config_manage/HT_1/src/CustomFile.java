public class CustomFile {

    private CustomFolder rootFolder;
    private String stFileName;
    private String stFileText;

    public CustomFile(CustomFolder rootFolder, String stFileName, String stFileText){
        this.rootFolder = rootFolder;
        this.stFileName = stFileName;
        this.stFileText = stFileText;
    }

    public CustomFolder getRootFolder() {
        return rootFolder;
    }

    public String getFileName() {
        return stFileName;
    }

    public String getFileText() {
        return stFileText;
    }

    public String getFilePath(){
        return rootFolder.getFolderPath() + "/" + stFileName;
    }
}
