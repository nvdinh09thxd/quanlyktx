package models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Room {
	private int id;
	private String name;
	private Area area;
	private int totalBed;
	private int emptyBed;
	private boolean haveToilet;
	private float price;

	public Room(int id) {
		super();
		this.id = id;
	}

	public Room(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

}
