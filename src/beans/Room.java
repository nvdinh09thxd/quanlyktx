package beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Room {
	private int id;
	private String name;
	private int area;
	private int numberOfBed;
	private boolean haveTolet;
	private float price;
}
