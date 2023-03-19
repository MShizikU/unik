package com.example.demo;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;


@SpringBootApplication
public class FileHasher {

	private File inputFile;
	private File hashedFile;

	public FileHasher(File inputFile, File hashedFile) {
		this.inputFile = inputFile;
		this.hashedFile = hashedFile;
	}

	@PostConstruct
	public void hashFile() throws IOException, NoSuchAlgorithmException {
		byte[] inputBytes = Files.readAllBytes(inputFile.toPath());
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		byte[] hashedBytes = digest.digest(inputBytes);
		String hashedString = new String(hashedBytes, StandardCharsets.UTF_8);
		FileWriter writer = new FileWriter(hashedFile);
		writer.write(hashedString);
		writer.close();
		inputFile.delete();
	}

	@PreDestroy
	public void cleanup() {
		hashedFile.delete();
	}

	public static void main(String[] args) throws IOException, NoSuchAlgorithmException {
		File inputFile = new File(args[0]);
		File hashedFile = new File(args[1]);

		if (!inputFile.exists()) {
			hashedFile.createNewFile();
			FileWriter writer = new FileWriter(hashedFile);
			writer.write("null");
			writer.close();
			return;
		}


		FileHasher fileHasher = new FileHasher(inputFile, hashedFile);
		fileHasher.hashFile();
	}
}