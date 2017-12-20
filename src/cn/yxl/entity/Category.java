package cn.yxl.entity;

public class Category {
    private String module_code;
    private String module_name;

    public String getModule_code() {
        return module_code;
    }

    public void setModule_code(String module_code) {
        this.module_code = module_code;
    }

    public String getModule_name() {
        return module_name;
    }

    public void setModule_name(String module_name) {
        this.module_name = module_name;
    }

    @Override
    public String toString() {
        return "Category [module_code=" + module_code + ", module_name="
                + module_name + "]";
    }

}
