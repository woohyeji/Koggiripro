package pack.model;

public class PostDto {
	int postNo, studyMemberNo;
	String title, content, postTime, views;
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getStudyMemberNo() {
		return studyMemberNo;
	}
	public void setStudyMemberNo(int studyMemberNo) {
		this.studyMemberNo = studyMemberNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPostTime() {
		return postTime;
	}
	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}
	public String getViews() {
		return views;
	}
	public void setViews(String views) {
		this.views = views;
	}
	
}
