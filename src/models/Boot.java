package models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Boot {
	private int id;
	private Member member;
	private Room room;
	private boolean status;
	private boolean accept;

	public Boot(Room room, boolean status) {
		super();
		this.room = room;
		this.status = status;
	}

	public Boot(int id, Member member, Room room, boolean accept) {
		super();
		this.id = id;
		this.member = member;
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
