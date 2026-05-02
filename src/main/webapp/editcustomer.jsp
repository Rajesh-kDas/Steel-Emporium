<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="updateuser" method="post">
Name:<input type="text" name="name" value="${usermaster[0].name}"><br>
Role:<input type="text" name="role" value="${usermaster[0].role}"><br>
Status:<input type="text" name="status" value="${usermaster[0].status}"><br>
<input type="hidden" name="user_id" value="${usermaster[0].user_id}"><br>
<input type="submit" name="btn" value="Update">
</form>