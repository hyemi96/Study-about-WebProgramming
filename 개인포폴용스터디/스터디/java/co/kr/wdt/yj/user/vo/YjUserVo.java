package co.kr.wdt.yj.user.vo;

import java.io.Serializable;

import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class YjUserVo implements Serializable {

	private static final long serialVersionUID = -5186502522336089085L;

	//	@AssertFalse  거짓인지?
	//	@AssertTrue 참인지?
	//	@DecimalMax 지정 값 이하의 실수인지?
	//	@DecimalMin 지정 값 이상의 실수인지?
	//	@Digits(integer=,fraction=) 정수 여부
	//	@Future 미래 날짜인지?
	//	@Max 지정 값 이상인지?
	//	@Min 지정 값 이하인지?
	//	@NotNull  Null이 아닌지?
	//	@Null Null인지?
	//	@Pattern(regex=,flag=) 정규식을 만족하는지?
	//	@Past   과거날짜인지?
	//	@Size(min=,max=)  문자열 또는 배열등의 길이 만족 여부

	//	message 항목이 없으면 영문 기본 문구가 보여짐
	//	@NotNull
	//	private String id;
	//	@Size(min="3",max="5",message="3자이상 5자미만으로 작성해야 합니다.")
	//	private String password;

	@NotEmpty
	private String userId;
	private String userNm;
	private String userPw;
	private String userPhone;
	private int addressNum=0;
	private String address1;
	private String address2;
	private String userEmail;
	private String ipAddr;
}
