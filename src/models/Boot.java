package models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Boot {
	private int id;
	private int idMember;
	private int idRoom;
	private boolean status;

	public Boot(int idRoom) {
		super();
		this.idRoom = idRoom;
	}

	public Boot(int idRoom, boolean status) {
		super();
		this.idRoom = idRoom;
		this.status = status;
	}

}
