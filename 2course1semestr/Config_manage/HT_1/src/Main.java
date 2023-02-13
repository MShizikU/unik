public class Main {
    public static void main(String[] args) {
        CustomFolder root = new CustomFolder(null, "root");
        FilesReader tmp = new FilesReader();
        tmp.getInfoFromZip(root);
    }
}
