import java.util.Random;

public class test {
	public static void main(String[] args) {
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < 6; i++) {
	        int n = random.nextInt(36);
	        if (n > 25) sb.append(n - 25);
	        else sb.append((char) (n + 65));
		}
		System.out.println(sb);

	}
}
