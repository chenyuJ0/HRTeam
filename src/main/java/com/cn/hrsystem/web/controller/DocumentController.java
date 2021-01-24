package com.cn.hrsystem.web.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cn.hrsystem.domain.Document;
import com.cn.hrsystem.service.DocumentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/doc")
public class DocumentController {

    @Autowired
    private DocumentService documentService;


    @RequestMapping("/showAll")
    public String findDim(@RequestParam(value="pn",defaultValue="1")Integer pn, Model model,Document document) {
        PageHelper.startPage(pn,5);
        List<Document> list = documentService.findAllDocuments(document);
        PageInfo<Document> info = new PageInfo<Document>(list);
        model.addAttribute("document", document);
        model.addAttribute("info",info);
        return "forward:/pages/document/list.jsp";
    }

    //添加
    @RequestMapping(value = "/add",method = {RequestMethod.GET})
    public String addDoc(Model model) {

        return "forward:/pages/document/add.jsp";
    }

    //post方式提交
    @RequestMapping(value = "/add",method = {RequestMethod.POST})
    public String submitDoc(@RequestParam("file") MultipartFile file,Document document){

        if (file != null) {
            // 取得当前上传文件的文件名称
            String myFileName = file.getOriginalFilename();
            //保存原始文件名
            document.setFilename(myFileName);
            //得到文件名的后缀
            String sname = myFileName.substring(myFileName.lastIndexOf("."));
            //得到无后缀的文件名字
            String fn = myFileName.substring(0,myFileName.lastIndexOf("."));
            //时间格式化格式
            SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyyMMddHHmmssSSS");
            //获取当前时间并作为时间戳
            String timeStamp=simpleDateFormat.format(new Date());
            //获取文件创建时间
            document.setCreate_date(new Date());
            //获取文件真实路径
            document.setRemark("D:\\hrsystem\\"+fn+timeStamp+sname);
            //String filename2 = myFileName.substring(myFileName.indexOf("."));
            //ystem.out.println(filename2);
            // 如果名称不为“”,说明该文件存在，否则说明该文件不存在
            try {
            	documentService.addDocument(document);
    			file.transferTo(new File(document.getRemark()));
    		} catch (IllegalStateException | IOException e) {
    			System.out.println("sowhat");
    		}
        }


        return "forward:/pages/document/add.jsp";
    }


    // 修改页面显示
    @RequestMapping(value = "/edit", method = {RequestMethod.GET})
    public String editPage(Integer id, Model model) throws Exception {
    	System.out.println(id);
        Document document = documentService.findDocumentById(id);
        System.out.println(document.toString());
        System.out.println(document == null);
        model.addAttribute("document", document);

        return "forward:/pages/document/edit.jsp";
    }

    // 修改息处理
    @RequestMapping(value = "/edit", method = {RequestMethod.POST})
    public String edit(Document document,HttpServletRequest request) throws Exception {
    	request.setCharacterEncoding("utf-8");
    	documentService.updateDocument(document);
        //重定向
        return "redirect:/doc/showAll";
    }

    @RequestMapping("/delete")
    public String deleteDoc(Integer id) {

        documentService.deleteDocumentById(id);
        //重定向
        return "redirect:/doc/showAll";
    }
    
    //下载文件
    @RequestMapping("/download")
	public ResponseEntity<byte[]> download(HttpServletRequest request,Integer id){
		FileInputStream is;
		byte[] tmp;
		//根据文件id查询到文件
		Document document = documentService.findDocumentById(id);
		if(document != null) {
			//获取文件真实路径
			try {
				is = new FileInputStream(document.getRemark());
				tmp = new byte[is.available()];
				is.read(tmp);
				is.close();
				//将要下载的文件流返回
				HttpHeaders httpHeaders = new HttpHeaders();
				httpHeaders.set("Content-Disposition", "attachment;filename="+new String(document.getFilename().getBytes("utf-8"),"iso-8859-1"));
				return new ResponseEntity<byte[]>(tmp,httpHeaders,HttpStatus.OK);
			} catch (IOException e1) {
				request.setAttribute("msg", "文件下载异常");
				return null;
			}
		}
		return null;
	}

}
