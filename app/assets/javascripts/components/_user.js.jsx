const User = ({user}) => {
    return(
        <div>
            <h1>User Profile</h1>
            {user.first_name}
            {user.last_name}
            {user.email}
            {user.phone}
            {user.user_pic}
        </div>
    )
}
