<template>
  <div>
    <el-form
	  :style='{"border":"1px solid #ddd","padding":"30px","boxShadow":"0 0px 0px #ddd","borderRadius":"5px","background":"#ffffff"}'
      class="add-update-preview"
      ref="ruleForm"
      :model="ruleForm"
      :rules="rules"
      label-width="80px"
    >
      <el-form-item :style='{"margin":"0 0 20px 0"}' label="选择在线测试" prop="paperid">
        <el-select @change="onPaperChange" v-model="ruleForm.paperid" placeholder="选择在线测试">
          <el-option
            v-for="(item,index) in paperOptions"
            v-bind:key="index"
            :label="item.name"
            :value="item.id"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item :style='{"margin":"0 0 20px 0"}' label="试题" prop="questionname">
        <el-input
          type="textarea"
          min="1"
          v-model="ruleForm.questionname"
          placeholder="试题"
          clearable
        ></el-input>
      </el-form-item>
      <el-form-item :style='{"margin":"0 0 20px 0"}' label="类型" prop="type">
        <el-select @change="typeChange" v-model="ruleForm.type" placeholder="类型">
          <el-option label="单选题" value="0"></el-option>
          <el-option label="多选题" value="1"></el-option>
          <el-option label="判断题" value="2"></el-option>
          <el-option label="填空题" value="3"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item :style='{"margin":"0 0 20px 0"}' v-if="ruleForm.type!=3&&ruleForm.type!=2" label="选项" prop="options">
        <div class="options" v-for="(item,index) in options" v-bind:key="index">
          {{item.text}}
          <el-button size="mini" @click="deleteOptions(index)" type="warning" round>删除</el-button>
        </div>
        <el-button size="small" @click="addOptionsDialog" type="primary" round>添加选项</el-button>
      </el-form-item>
      <el-form-item :style='{"margin":"0 0 20px 0"}' v-if="ruleForm.type==0 && options.length>0" label="答案" prop="answer">
        <el-select v-model="ruleForm.answer">
          <el-option
            :label="item.code"
            :value="item.code"
            v-for="(item,index) in options"
            v-bind:key="index"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item :style='{"margin":"0 0 20px 0"}' v-if="ruleForm.type==1 && options.length>0" label="答案" prop="answer">
        <el-select v-model="ruleForm.answer" multiple>
          <el-option
            :label="item.code"
            :value="item.code"
            v-for="(item,index) in options"
            v-bind:key="index"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item :style='{"margin":"0 0 20px 0"}' v-if="ruleForm.type==2 && options.length>0" label="答案" prop="answer">
        <el-select v-model="ruleForm.answer">
          <el-option
            :label="item.text"
            :value="item.code"
            v-for="(item,index) in options"
            v-bind:key="index"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item :style='{"margin":"0 0 20px 0"}' v-if="ruleForm.type==3" label="答案" prop="answer">
        <el-input v-model="ruleForm.answer" placeholder="答案" clearable></el-input>
      </el-form-item>
      <el-form-item :style='{"margin":"0 0 20px 0"}' label="分数" prop="score">
        <el-input-number v-model="ruleForm.score" :min="1" :max="100" label="分数"></el-input-number>
      </el-form-item>
      <el-form-item :style='{"margin":"0 0 20px 0"}' label="分析" prop="analysis">
        <el-input
          type="textarea"
          min="1"
          v-model="ruleForm.analysis"
          placeholder="分析"
          clearable
        ></el-input>
      </el-form-item>
      <el-form-item :style='{"margin":"0 0 20px 0"}' label="排序" prop="sequence">
        <el-input-number v-model="ruleForm.sequence" :min="1" :max="20" label="排序"></el-input-number>
      </el-form-item>
      <el-form-item :style='{"padding":"0","margin":"0"}'>
        <el-button :style='{"border":"0","cursor":"pointer","padding":"0","margin":"0 20px 0 0","outline":"none","color":"rgba(255, 255, 255, 1)","borderRadius":"4px","background":"#337ab7","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}' type="primary" @click="onSubmit">提交</el-button>
        <el-button :style='{"border":"1px solid #1b5a90","cursor":"pointer","padding":"0","margin":"0","outline":"none","color":"#1b5a90","borderRadius":"4px","background":"rgba(255, 255, 255, 1)","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}' @click="back()">取消</el-button>
      </el-form-item>
    </el-form>
    <el-dialog title="添加选项" :visible.sync="addOptionsDialogVisiable" width="50%">
      <el-form ref="dialogForm" :model="dialogForm" :rules="dialogRules" label-width="80px">
        <el-form-item label="选项" prop="code">
          <el-select v-model="dialogForm.code" placeholder="选项">
            <el-option label="A" value="A"></el-option>
            <el-option label="B" value="B"></el-option>
            <el-option label="C" value="C"></el-option>
            <el-option label="D" value="D"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="内容" prop="text">
          <el-input type="textarea" min="1" v-model="dialogForm.text" placeholder="内容" clearable></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="addOptionsDialogVisiable = false">取 消</el-button>
        <el-button type="primary" @click="addOptions">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<script>
import { isNumber } from "@/utils/validate";
export default {
  data() {
    var validateNumber = (rule, value, callback) => {
      if (!isNumber(value)) {
        callback(new Error("请输入数字"));
      } else {
        callback();
      }
    };
    return {
      ruleForm: {},
      options: [],
      addOptionsDialogVisiable: false,
      dialogForm: {},
      paperOptions: [],
      dialogRules: {
        text: [{ required: true, message: "请填写内容", trigger: "blur" }],
        code: [{ required: true, message: "请选择选项", trigger: "blur" }]
      },
      rules: {
        paperid: [{ required: true, message: "请选择在线测试", trigger: "blur" }],
        questionname: [
          { required: true, message: "试题内容不能为空", trigger: "blur" }
        ],
        type: [{ required: true, message: "请选择试题类型", trigger: "blur" }],
        sequence: [{ required: true, message: "排序不能为空", trigger: "blur" }],
        analysis: [
          { required: true, message: "分析不能为空", trigger: "blur" }
        ],
        score: [{ required: true, message: "分数不能为空", trigger: "blur" }]
      }
    };
  },
  props: ["parent"],
  methods: {
    // 初始化
    init(id) {
      if (id) {
        this.info(id);
      } else {
        this.$http({
          url: this.$api.exampaperpage,
          method: "get",
          params: {
            page: 1,
            limit: 999
          }
        }).then(({ data }) => {
          if (data && data.code === 0) {
            this.paperOptions = data.data.list;
          }
        });
        this.ruleForm.created = new Date();
      }
    },
    info(id) {
      this.$http({
        url: this.$api.exampaperpage,
        method: "get",
        params: {
          page: 1,
          limit: 999
        }
      }).then(({ data }) => {
        if (data && data.code === 0) {
          this.paperOptions = data.data.list;
          this.$http({
            url: `${this.$api.examquestioninfo}${id}`,
            method: "get"
          }).then(({ data }) => {
            if (data && data.code === 0) {
              this.ruleForm = data.data;
              this.ruleForm.type = this.ruleForm.type + "";
              this.options = JSON.parse(this.ruleForm.options);
              if (this.ruleForm.type == 1) {
                this.ruleForm.answer = this.ruleForm.answer.split(",");
              }
              console.log(this.options);
            } else {
              this.$message.error(data.msg);
            }
          });
        }
      });
    },
    // 提交
    onSubmit() {
      console.log(this.ruleForm.answer);
      // return;
      if (!this.options && this.type != 3) {
        this.$message.error("请设置选项");
        return;
      }
      if (this.ruleForm.type == 1) {
        this.ruleForm.answer = this.ruleForm.answer.join(",");
        console.log(this.ruleForm.answer);
      }
      this.ruleForm.options = JSON.stringify(this.options);
      this.$refs["ruleForm"].validate(valid => {
        if (valid) {
          this.$http({
            url: `${
              !this.ruleForm.id
                ? `${this.$api.examquestionsave}`
                : `${this.$api.examquestionupdate}`
            }`,
            method: "post",
            data: this.ruleForm
          }).then(({ data }) => {
            if (data && data.code === 0) {
              this.$message({
                message: "操作成功",
                type: "success",
                duration: 1500,
                onClose: () => {
                  this.parent.showFlag = false;
                  this.parent.search();
                }
              });
            } else {
              this.$message.error(data.msg);
            }
          });
        }
      });
    },
    // 返回
    back() {
      this.parent.showFlag = false;
    },
    addOptionsDialog() {
      this.addOptionsDialogVisiable = !this.addOptionsDialogVisiable;
    },
    addOptions() {
      this.$refs["dialogForm"].validate(valid => {
        if (valid) {
          this.options.push({
            text: this.dialogForm.code + "." + this.dialogForm.text,
            code: this.dialogForm.code
          });
          this.dialogForm = {};
          this.addOptionsDialogVisiable = !this.addOptionsDialogVisiable;
        }
      });
    },
    deleteOptions(index) {
      console.log(index);
      this.options.splice(index, 1);
    },
    onPaperChange(e) {
      console.log(e);
      for (let item of this.paperOptions) {
        if (item.id == e) {
          // console.log(item.name)
          this.ruleForm.papername = item.name;
        }
      }
    },
    typeChange(e) {
      console.log(e);
      if (e == 2) {
        this.options = [];
        this.options.push({
          text: "A.对",
          code: "A"
        });
        this.options.push({
          text: "B.错",
          code: "B"
        });
      } else {
        this.options = [];
      }
    }
  }
};
</script>
<style lang="scss" scoped>

.options {
  margin-bottom: 10px;
  display: flex;
  justify-content: space-between;
  width: 200px;
}
	
	.el-date-editor.el-input {
		width: auto;
	}
	
	.add-update-preview .el-form-item /deep/ .el-form-item__label {
	  	  padding: 0 10px 0 0;
	  	  color: #666;
	  	  font-weight: 500;
	  	  width: 80px;
	  	  font-size: 14px;
	  	  line-height: 40px;
	  	  text-align: right;
	  	}
	
	.add-update-preview .el-form-item /deep/ .el-form-item__content {
	  margin-left: 80px;
	}
	
	.add-update-preview .el-input /deep/ .el-input__inner {
	  	  border: 1px solid #5479bb;
	  	  border-radius: 4px;
	  	  padding: 0 12px;
	  	  box-shadow: 1px 2px 3px #eee;
	  	  outline: none;
	  	  color: #aaa;
	  	  width: 400px;
	  	  font-size: 14px;
	  	  height: 40px;
	  	}
	
	.add-update-preview .el-select /deep/ .el-input__inner {
	  	  border: 1px solid #5479bb;
	  	  border-radius: 4px;
	  	  padding: 0 10px;
	  	  box-shadow: 1px 2px 3px #eee;
	  	  outline: none;
	  	  color: #aaa;
	  	  width: 200px;
	  	  font-size: 14px;
	  	  height: 40px;
	  	}
	
	.add-update-preview .el-date-editor /deep/ .el-input__inner {
	  	  border: 1px solid #5479bb;
	  	  border-radius: 4px;
	  	  padding: 0 10px 0 30px;
	  	  box-shadow: 1px 2px 3px #eee;
	  	  outline: none;
	  	  color: #aaa;
	  	  width: 200px;
	  	  font-size: 14px;
	  	  height: 40px;
	  	}
	
	.add-update-preview /deep/ .el-upload--picture-card {
		background: transparent;
		border: 0;
		border-radius: 0;
		width: auto;
		height: auto;
		line-height: initial;
		vertical-align: middle;
	}
	
	.add-update-preview /deep/ .upload .upload-img {
	  	  border: 1px dashed #5479bb;
	  	  cursor: pointer;
	  	  border-radius: 6px;
	  	  color: #5479bb;
	  	  width: 200px;
	  	  font-size: 32px;
	  	  line-height: 120px;
	  	  text-align: center;
	  	  height: 120px;
	  	}
	
	.add-update-preview /deep/ .el-upload-list .el-upload-list__item {
	  	  border: 1px dashed #5479bb;
	  	  cursor: pointer;
	  	  border-radius: 6px;
	  	  color: #5479bb;
	  	  width: 200px;
	  	  font-size: 32px;
	  	  line-height: 120px;
	  	  text-align: center;
	  	  height: 120px;
	  	}
	
	.add-update-preview /deep/ .el-upload .el-icon-plus {
	  	  border: 1px dashed #5479bb;
	  	  cursor: pointer;
	  	  border-radius: 6px;
	  	  color: #5479bb;
	  	  width: 200px;
	  	  font-size: 32px;
	  	  line-height: 120px;
	  	  text-align: center;
	  	  height: 120px;
	  	}
	
	.add-update-preview .el-textarea /deep/ .el-textarea__inner {
	  	  border: 1px solid #5479bb;
	  	  border-radius: 4px;
	  	  padding: 12px;
	  	  box-shadow: 1px 2px 3px #eee;
	  	  outline: none;
	  	  color: #aaa;
	  	  width: 400px;
	  	  font-size: 14px;
	  	  height: auto;
	  	}
</style>
