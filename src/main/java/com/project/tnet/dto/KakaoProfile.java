package com.project.tnet.dto;

import lombok.Data;

@Data
public class KakaoProfile {
	public Long id;
	public String connected_at;
	public Properties properties;
	public KakaoAccount kakao_account;

	@Data
	public class Properties {
		public String nickname;
		public String profile_image;	//추가해야한다.
		public String thumbnail_image;  //추가해야한다.
	}

	@Data
	public class KakaoAccount {
		public Boolean profile_nickname_needs_agreement;
		public Boolean profile_image_needs_agreement; //추가해야한다.
		public Profile profile;
		public Boolean has_email;
		public Boolean email_needs_agreement;
		public Boolean is_email_valid;
		public Boolean is_email_verified;
		public String email;
		public Boolean has_age_range;
		public Boolean age_range_needs_agreement;
		public String age_range;
		public Boolean has_gender;
		public Boolean gender_needs_agreement;
		public String gender;
		
		@Data
		public class Profile {
			public String nickname;
			public String thumbnail_image_url; //추가해야한다.
			public String profile_image_url; //추가해야한다.
			public String is_default_image; //추가해야한다.
		}
	}
}
