/**
 * 描述:组和用户关联的javaBean
 * @author liuliehui
 */
package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.nastation.pm.bean.GroupUser;
import com.nastation.pm.util.DBConn;

public class GroupUserBO {

    /**
     * 添加用户组
     */
    public void addGroupUser(GroupUser groupUser) throws SQLException {
        Connection conn = DBConn.getConnection();
        String sql = "insert into t_group_user(user_id,group_id) values(?,?)";

        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, groupUser.getUserId());
            pstmt.setInt(2, groupUser.getGroupId());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }

    }

    /**
     * 判断用户组是否存在
     */
    public boolean groupUserExit(GroupUser groupUser) {
        boolean flag = false;
        Connection conn = DBConn.getConnection();
        String sql = "select * from t_group_user where user_id=? and group_id=?";

        PreparedStatement pst;
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1, groupUser.getUserId());
            pst.setInt(2, groupUser.getGroupId());
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
        return flag;
    }

    /**
     * 判断组ID为groupId的用户组是否存在
     */
    public boolean groupUserExit(int groupId) {
        boolean flag = false;
        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        String sql = "select * from t_group_user where group_id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, groupId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
        return flag;
    }

    /**
     * 删除组ID为groupId的用户组
     */
    public void deleteGroupUser(int groupId) {
        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        String sql = "delete from t_group_user where id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, groupId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }

    }

    /**
     * 删除用户组用户
     */
    public void deleteUserGroup(GroupUser userGroup) {
        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        String sql = "delete from t_group_user where user_id=? and group_id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userGroup.getUserId());
            pstmt.setInt(2, userGroup.getGroupId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }

    }

    public int userGroupId(int groupId, int userId) {
        int ugId = 0;
        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        String sql = "select id from t_group_user where group_id=? and user_id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, groupId);
            pstmt.setInt(2, userId);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            ugId = rs.getInt("id");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
        return ugId;
    }

}
