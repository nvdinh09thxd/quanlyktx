package models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Boot {
	private int id;
	private Student student;
	private Room room;
	private boolean status;
	private boolean accept;

	public Boot(Room room, Student student, boolean status) {
		super();
		this.room = room;
		this.student = student;
		this.status = status;
	}

	public Boot(int id, Student student, Room room, boolean accept) {
		super();
		this.id = id;
		this.student = student;
		this.room = room;
		this.accept = accept;
	}

	public Boot(int id, Room room, boolean accept) {
		super();
		this.id = id;
		this.room = room;
		this.accept = accept;
	}

}
